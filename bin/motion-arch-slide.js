#!/usr/bin/env node
'use strict';

const fs = require('fs');
const path = require('path');
const os = require('os');

const SKILL_NAME = 'motion-arch-slide';
const BUNDLE_ITEMS = [
  'SKILL.md',
  'DESIGN.md',
  'INSTALL.md',
  'AGENTS.md',
  'references',
  'templates',
  'slides',
];

const PKG_ROOT = path.resolve(__dirname, '..');

function printHelp() {
  console.log(`
motion-arch-slide — install Agent Skill for Cursor / Claude Code / Codex

Usage:
  npx motion-arch-slide [install] [options]
  npx github:jiruibabaya/motion-arch-slide [options]

Commands:
  install          Copy skill bundle to agent directories (default)
  info             Show target install paths (dry run)
  help             Show this help

Options:
  --scope <user|project>     Install scope (default: user)
  --agents <list>            Comma-separated: cursor,claude,codex (default: all)
  --cwd <path>               Project root for --scope project (default: process.cwd())

Examples:
  npx motion-arch-slide
  npx motion-arch-slide install --scope project
  npx motion-arch-slide install --agents cursor,claude
  npx motion-arch-slide info
`);
}

function parseArgs(argv) {
  const args = { command: 'install', scope: 'user', agents: ['cursor', 'claude', 'codex'], cwd: process.cwd() };
  const rest = [...argv];

  if (rest[0] && !rest[0].startsWith('-')) {
    const cmd = rest.shift();
    if (cmd === 'help' || cmd === '-h' || cmd === '--help') args.command = 'help';
    else if (cmd === 'info') args.command = 'info';
    else if (cmd === 'install') args.command = 'install';
    else {
      console.error(`Unknown command: ${cmd}`);
      printHelp();
      process.exit(1);
    }
  }

  while (rest.length) {
    const flag = rest.shift();
    switch (flag) {
      case '-h':
      case '--help':
        args.command = 'help';
        break;
      case '--scope':
        args.scope = rest.shift();
        if (!['user', 'project'].includes(args.scope)) {
          console.error('--scope must be user or project');
          process.exit(1);
        }
        break;
      case '--agents':
        args.agents = rest.shift().split(',').map((s) => s.trim()).filter(Boolean);
        break;
      case '--cwd':
        args.cwd = path.resolve(rest.shift());
        break;
      default:
        console.error(`Unknown option: ${flag}`);
        printHelp();
        process.exit(1);
    }
  }

  return args;
}

function homeDir() {
  return os.homedir();
}

function codexHome() {
  return process.env.CODEX_HOME || path.join(homeDir(), '.codex');
}

function targetDirs(agent, scope, projectRoot) {
  const name = SKILL_NAME;
  switch (agent) {
    case 'cursor':
      return scope === 'project'
        ? [path.join(projectRoot, '.cursor', 'skills', name)]
        : [path.join(homeDir(), '.cursor', 'skills', name)];
    case 'claude':
      return scope === 'project'
        ? [path.join(projectRoot, '.claude', 'skills', name)]
        : [path.join(homeDir(), '.claude', 'skills', name)];
    case 'codex':
      if (scope === 'project') {
        throw new Error('Codex skills are user-scoped only. Use --scope user for codex.');
      }
      return [path.join(codexHome(), 'skills', name)];
    default:
      throw new Error(`Unknown agent: ${agent}. Use cursor, claude, or codex.`);
  }
}

function copyBundle(dest) {
  fs.rmSync(dest, { recursive: true, force: true });
  fs.mkdirSync(dest, { recursive: true });

  for (const item of BUNDLE_ITEMS) {
    const src = path.join(PKG_ROOT, item);
    if (!fs.existsSync(src)) continue;
    const dst = path.join(dest, item);
    fs.cpSync(src, dst, { recursive: true });
  }
}

function cmdInfo(args) {
  console.log('motion-arch-slide install targets:\n');
  for (const agent of args.agents) {
    try {
      for (const dir of targetDirs(agent, args.scope, args.cwd)) {
        console.log(`  [${agent}] ${dir}`);
      }
    } catch (err) {
      console.log(`  [${agent}] (skipped) ${err.message}`);
    }
  }
  console.log(`\nBundle source: ${PKG_ROOT}`);
}

function cmdInstall(args) {
  const installed = [];

  for (const agent of args.agents) {
    let dirs;
    try {
      dirs = targetDirs(agent, args.scope, args.cwd);
    } catch (err) {
      console.warn(`Skip ${agent}: ${err.message}`);
      continue;
    }
    for (const dir of dirs) {
      copyBundle(dir);
      installed.push({ agent, dir });
      console.log(`Installed [${agent}] -> ${dir}`);
    }
  }

  if (!installed.length) {
    console.error('Nothing installed.');
    process.exit(1);
  }

  console.log('\nDone. Start a new agent turn, then use @motion-arch-slide');
}

function main() {
  const args = parseArgs(process.argv.slice(2));

  if (args.command === 'help') {
    printHelp();
    return;
  }
  if (args.command === 'info') {
    cmdInfo(args);
    return;
  }
  cmdInstall(args);
}

main();
