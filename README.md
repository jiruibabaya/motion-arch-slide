<div align="center">

# motion-arch-slide

[**简体中文**](README.zh-CN.md) · [English](README.md)

**Agent Skill for animated architecture slides — Cursor, Claude Code, Codex (HTML/CSS/SVG, zero build).**

<br />

[![License: MIT](https://img.shields.io/badge/License-MIT-0e7490?style=for-the-badge)](LICENSE)
[![npm](https://img.shields.io/badge/npx-motion--arch--slide-ea580c?style=for-the-badge)](https://www.npmjs.com/package/motion-arch-slide)
[![Agent Skill](https://img.shields.io/badge/type-Agent%20Skill-059669?style=for-the-badge)](SKILL.md)

[Install](#install) · [SKILL.md](SKILL.md) · [Design spec](DESIGN.md)

</div>

---

## Preview

<p align="center">
  <img src="assets/preview.png" alt="Architecture walkthrough slide" width="920" />
</p>

<p align="center">
  <sub>Reference: <code>slides/deepseek-harness-v3.html</code> — open locally in any browser</sub>
</p>

---

## What it is

An installable **Agent Skill** that encodes diagram type rules, semantic colors, layout traps, and animation contracts — not just a blank template.

---

## Install

### Recommended: `npx` (no clone)

```bash
npx motion-arch-slide
```

Before npm publish, run from GitHub:

```bash
npx github:jiruibabaya/motion-arch-slide
```

**Options:**

```bash
npx motion-arch-slide --agents cursor,claude
npx motion-arch-slide --scope project
npx motion-arch-slide info
```

Requires Node.js 18+. Installs to Cursor, Claude Code, and Codex user skill directories.

### Alternatives

```bash
git clone https://github.com/jiruibabaya/motion-arch-slide.git
cd motion-arch-slide
npm run install-skill
```

See [INSTALL.md](INSTALL.md)

### After install

| Agent | Invoke |
|---|---|
| **Cursor** | `@motion-arch-slide` |
| **Claude Code** | `@motion-arch-slide` |
| **Codex** | Auto-loaded next turn |

**Update:** run `npx motion-arch-slide` again.

---

## License

[MIT](LICENSE) © 2026 [jiruibabaya](https://github.com/jiruibabaya)
