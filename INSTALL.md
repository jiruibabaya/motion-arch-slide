# Install

Install the **skill bundle** into Cursor, Claude Code, or Codex.

## Quick install (recommended)

```bash
npx motion-arch-slide
```

Published on npm: [motion-arch-slide](https://www.npmjs.com/package/motion-arch-slide)

Requires **Node.js 18+**. No dependencies.

---

## CLI reference

```bash
npx motion-arch-slide              # install (default command)
npx motion-arch-slide install      # same
npx motion-arch-slide info         # show paths, no write
npx motion-arch-slide --help
```

| Flag | Default | Description |
|---|---|---|
| `--scope user` | ✓ | `~/.cursor/skills/` etc. |
| `--scope project` | | `.cursor/skills/` in `--cwd` |
| `--agents cursor,claude,codex` | all | Subset of agents |
| `--cwd <path>` | `.` | Project root for `--scope project` |

Examples:

```bash
npx motion-arch-slide --agents cursor,claude
npx motion-arch-slide --scope project --cwd /path/to/repo
```

---

## Install targets

| Agent | User (global) | Project-local |
|---|---|---|
| **Cursor** | `~/.cursor/skills/motion-arch-slide/` | `.cursor/skills/motion-arch-slide/` |
| **Claude Code** | `~/.claude/skills/motion-arch-slide/` | `.claude/skills/motion-arch-slide/` |
| **Codex** | `~/.codex/skills/motion-arch-slide/` | user scope only |

---

## What gets copied

| Path | Required |
|---|---|
| `SKILL.md` | yes |
| `DESIGN.md` | yes |
| `references/` | yes |
| `templates/` | yes |
| `slides/` | recommended (reference outputs) |

---

## Other install methods

**From a git clone:**

```bash
git clone https://github.com/jiruibabaya/motion-arch-slide.git
cd motion-arch-slide
npm run install-skill
```

**Shell wrappers** (delegate to the same Node CLI):

```powershell
.\scripts\install-skill.ps1
.\scripts\install-skill.ps1 -Scope project
```

```bash
./scripts/install-skill.sh --scope project --agents cursor
```

**Codex skill-installer** (alternative):

```bash
python "$CODEX_HOME/skills/.system/skill-installer/scripts/install-skill-from-github.py" \
  --repo jiruibabaya/motion-arch-slide --path . --name motion-arch-slide
```

---

## Verify

1. Check folder exists, e.g. `~/.cursor/skills/motion-arch-slide/SKILL.md`.
2. New agent turn → `@motion-arch-slide`.
3. Ask agent to create a slide; it should read `DESIGN.md` and avoid canvas `backdrop-filter`.

---

## Update

```bash
npx motion-arch-slide
```

Overwrites previous install with the latest npm release.

---

## 中文

### 一键安装

```bash
npx motion-arch-slide
```

### 常用参数

```bash
npx motion-arch-slide info
npx motion-arch-slide --scope project
npx motion-arch-slide --agents cursor,claude
```

### 装到哪里

| Agent | 用户目录 | 项目目录 |
|---|---|---|
| Cursor | `~/.cursor/skills/motion-arch-slide/` | `.cursor/skills/motion-arch-slide/` |
| Claude Code | `~/.claude/skills/motion-arch-slide/` | `.claude/skills/motion-arch-slide/` |
| Codex | `~/.codex/skills/motion-arch-slide/` | — |

### 更新

再执行 `npx motion-arch-slide` 即可。
