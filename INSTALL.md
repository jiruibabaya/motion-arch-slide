# Install — motion-arch-slide

Install the **skill bundle** (not the whole monorepo tooling) into your agent's skill directory.

## Skill bundle files

These paths are copied on install:

| Path | Required |
|---|---|
| `SKILL.md` | yes |
| `DESIGN.md` | yes |
| `references/` | yes |
| `templates/` | yes |
| `slides/` | recommended (reference outputs) |

Not copied: `README*`, `docs/`, `.github/`, `assets/`, install scripts.

---

## One-command install

From repo root after `git clone`:

```powershell
# Windows — user scope (default): Cursor + Claude + Codex
.\scripts\install-skill.ps1

# Project scope only
.\scripts\install-skill.ps1 -Scope project

# Pick agents
.\scripts\install-skill.ps1 -Agents cursor,claude
```

```bash
# macOS / Linux
./scripts/install-skill.sh
./scripts/install-skill.sh --scope project
./scripts/install-skill.sh --agents cursor,claude,codex
```

---

## Manual install paths

| Agent | User (global) | Project-local |
|---|---|---|
| **Cursor** | `~/.cursor/skills/motion-arch-slide/` | `.cursor/skills/motion-arch-slide/` |
| **Claude Code** | `~/.claude/skills/motion-arch-slide/` | `.claude/skills/motion-arch-slide/` |
| **Codex** | `~/.codex/skills/motion-arch-slide/` | *(use user scope)* |

Copy the [skill bundle files](#skill-bundle-files) into the target folder. Restart or start a new agent turn.

---

## Codex: install from GitHub

If you have Codex's skill-installer:

```bash
python "$CODEX_HOME/skills/.system/skill-installer/scripts/install-skill-from-github.py" \
  --repo jiruibabaya/motion-arch-slide \
  --path . \
  --name motion-arch-slide
```

`$CODEX_HOME` defaults to `~/.codex`.

---

## Verify

1. Skill folder contains `SKILL.md` + `references/` + `templates/`.
2. In agent chat, ask: *「用 motion-arch-slide 规范，从 templates 复制一页架构 slide」*
3. Agent should read `DESIGN.md`, use semantic colors, not add canvas `backdrop-filter`.

---

## Update

Re-run the install script from a fresh `git pull`, or delete the skill folder and install again.

---

# 安装说明（中文）

## 一键安装

```powershell
git clone https://github.com/jiruibabaya/motion-arch-slide.git
cd motion-arch-slide
.\scripts\install-skill.ps1
```

## 安装位置

| Agent | 用户目录 | 项目目录 |
|---|---|---|
| **Cursor** | `~/.cursor/skills/motion-arch-slide/` | `.cursor/skills/motion-arch-slide/` |
| **Claude Code** | `~/.claude/skills/motion-arch-slide/` | `.claude/skills/motion-arch-slide/` |
| **Codex** | `~/.codex/skills/motion-arch-slide/` | — |

## 安装后

- Cursor / Claude：`@motion-arch-slide`
- 让 Agent 先读 `SKILL.md` 和 `DESIGN.md`，再从 `templates/` 复制出片

## 更新

仓库里 `git pull` 后重新运行 `install-skill.ps1` / `install-skill.sh`。
