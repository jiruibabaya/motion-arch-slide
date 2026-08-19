<div align="center">

# motion-arch-slide

[中文 README](README.md) · **English**

**Installable Agent Skill — full-viewport animated architecture slides for Cursor, Claude Code & Codex**

Single-file HTML · CSS dash flow · SVG journey dots · zero build

<br />

[![npm version](https://img.shields.io/npm/v/motion-arch-slide?style=for-the-badge&color=ea580c)](https://www.npmjs.com/package/motion-arch-slide)
[![License: MIT](https://img.shields.io/badge/License-MIT-0e7490?style=for-the-badge)](LICENSE)
[![Node](https://img.shields.io/badge/node-%3E%3D18-059669?style=for-the-badge)](https://nodejs.org)

```bash
npx motion-arch-slide
```

[Install](#install) · [Usage](#usage) · [Docs](#documentation) · [npm](https://www.npmjs.com/package/motion-arch-slide)

</div>

---

## Preview

<p align="center">
  <img src="assets/preview.png" alt="Architecture walkthrough slide — narrative, animated diagram, chapter bar" width="920" />
</p>

<p align="center">
  Reference output: <code>slides/deepseek-harness-v3.html</code> — open in any browser (<code>file://</code> works)
</p>

---

## What it is

**motion-arch-slide** is not a slide framework — it is an **Agent Skill** that teaches coding agents *how* to build screen-recording explainer pages:

| Encoded in the skill | Why it matters |
|---|---|
| Architecture vs flowchart vs sequence | Right diagram type per intent |
| Semantic colors (`entry` / `core` / `cap`) | Consistent, readable diagrams |
| Layout hard rules (grid, surfaces, routing) | Avoids known visual bugs |
| Animation contract (dash + `animateMotion`) | Smooth loops without GSAP |

Ships with a **copy-ready template** and a **reference slide** (DeepSeek Harness walkthrough style).

---

## Install

**Requires [Node.js 18+](https://nodejs.org).**

```bash
npx motion-arch-slide
```

| Option | Effect |
|---|---|
| `npx motion-arch-slide info` | Print install paths (dry run) |
| `npx motion-arch-slide --agents cursor,claude` | Install subset of agents |
| `npx motion-arch-slide --scope project` | Install into current repo (`.cursor/skills/`, `.claude/skills/`) |

**Install locations (user scope):**

| Agent | Path |
|---|---|
| Cursor | `~/.cursor/skills/motion-arch-slide/` |
| Claude Code | `~/.claude/skills/motion-arch-slide/` |
| Codex | `~/.codex/skills/motion-arch-slide/` |

More options → [INSTALL.md](INSTALL.md)

**Update the skill:** run `npx motion-arch-slide` again.

---

## Usage

1. **Install** (above) and start a **new agent turn**.
2. Invoke the skill:
   - Cursor / Claude Code: `@motion-arch-slide`
   - Or: *"Use motion-arch-slide to create an architecture walkthrough slide for …"*
3. Agent reads `SKILL.md` + `DESIGN.md`, copies `templates/slide-architecture.html`, fills narrative / nodes / edges.
4. Open the generated HTML locally — no dev server required.

**Example prompt:**

> Use motion-arch-slide to build one architecture slide for the noetix-server main path, WebSocket to TTS, 6 chapters in the footer bar.

---

## Documentation

| Doc | Contents |
|---|---|
| [SKILL.md](SKILL.md) | Agent workflow, diagram decision table, semantic colors |
| [DESIGN.md](DESIGN.md) | Hard constraints + acceptance checklist |
| [INSTALL.md](INSTALL.md) | All install methods, flags, verification |
| [AGENTS.md](AGENTS.md) | Entry pointer for Codex / generic agents |
| [references/](references/) | Diagram types, colors, layout, animation details |

---

## Repository layout

```
motion-arch-slide/
├── SKILL.md                 # Agent entry point
├── bin/motion-arch-slide.js # npx CLI
├── templates/               # Start new slides here
├── slides/                  # Reference outputs
├── references/              # Skill reference docs
└── scripts/                 # install wrappers (optional)
```

---

## Develop locally

```bash
git clone https://github.com/jiruibabaya/motion-arch-slide.git
cd motion-arch-slide
npm run install-skill    # same as npx, from source
npm test                 # prints install targets
```

---

## License

[MIT](LICENSE) © 2026 [jiruibabaya](https://github.com/jiruibabaya)
