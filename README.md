<div align="center">

# motion-arch-slide

[**简体中文**](README.zh-CN.md) · [English](README.md)

**Agent Skill + templates for full-viewport animated architecture slides (HTML/CSS/SVG, zero build).**

<br />

[![License: MIT](https://img.shields.io/badge/License-MIT-0e7490?style=for-the-badge)](LICENSE)
[![Agent Skill](https://img.shields.io/badge/type-Agent%20Skill-059669?style=for-the-badge)](SKILL.md)

[Install](#install) · [SKILL.md](SKILL.md) · [Design spec](DESIGN.md)

</div>

---

## Preview

<p align="center">
  <img src="assets/preview.png" alt="Architecture walkthrough slide" width="920" />
</p>

<p align="center">
  <sub>Reference output: <code>slides/deepseek-harness-v3.html</code> — open locally in any browser</sub>
</p>

---

## What it is

A **portable Agent Skill** that teaches Claude, Codex, Cursor, and similar tools how to produce screen-recording-ready explainer slides:

| Delivers | Avoids |
|---|---|
| 100vw × 100vh PPT-style layout | Webpack / Vite |
| Flowing dashed edges + journey dots | GSAP / Lottie |
| Semantic node colors (entry / core / cap) | One-off diagram styling |
| Single HTML file per chapter | Deck toolchain lock-in |

The skill encodes **diagram type choice**, **color semantics**, **layout traps**, and **animation contracts** — not just a template.

---

## Install

Clone once, then install into your agent's skill directory:

```bash
git clone https://github.com/jiruibabaya/motion-arch-slide.git
cd motion-arch-slide
```

**Windows (PowerShell)** — installs to Cursor, Claude Code, and Codex user skill dirs:

```powershell
.\scripts\install-skill.ps1
```

**macOS / Linux:**

```bash
chmod +x scripts/install-skill.sh
./scripts/install-skill.sh
```

**Project-local only** (share with a team repo):

```powershell
.\scripts\install-skill.ps1 -Scope project
# → .cursor/skills/motion-arch-slide/ and .claude/skills/motion-arch-slide/
```

**Codex** (if you use the built-in installer):

```bash
python ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo jiruibabaya/motion-arch-slide --path . --name motion-arch-slide
```

Details → [INSTALL.md](INSTALL.md)

### Use after install

| Agent | Invoke |
|---|---|
| **Cursor** | `@motion-arch-slide` or mention "use motion-arch-slide skill" |
| **Claude Code** | Skill auto-loads from `~/.claude/skills/`; or `@motion-arch-slide` |
| **Codex** | Skill loads from `~/.codex/skills/` on next turn |

---

## Skill bundle layout

```
motion-arch-slide/
├── SKILL.md              ← agent entry (required)
├── DESIGN.md             ← hard constraints + QA checklist
├── INSTALL.md            ← install paths per agent
├── references/           ← diagram types, colors, animation, layout
├── templates/            ← copy to start a new slide
├── slides/               ← reference outputs (e.g. deepseek-harness-v3.html)
└── scripts/install-skill.* 
```

---

## Quick start (humans)

1. Install the skill (above) so your agent follows the rules.
2. Copy `templates/slide-architecture.html` → `slides/my-topic-v1.html`
3. Edit narrative, nodes, edges, chapter bar.
4. Open the HTML file in a browser — `file://` works, no server required.

---

## License

[MIT](LICENSE) © 2026 [jiruibabaya](https://github.com/jiruibabaya)
