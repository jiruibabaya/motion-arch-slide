# Install — motion-arch-slide

## Recommended: npx

```bash
npx motion-arch-slide
```

From GitHub (works before npm publish):

```bash
npx github:jiruibabaya/motion-arch-slide
```

| Flag | Description |
|---|---|
| `--scope user` | Global skill dirs (default) |
| `--scope project` | `.cursor/skills/` + `.claude/skills/` in current directory |
| `--agents cursor,claude,codex` | Subset of agents |
| `--cwd <path>` | Project root when using `--scope project` |

```bash
npx motion-arch-slide info
npx motion-arch-slide install --scope project --agents cursor
```

Requires **Node.js 18+**. Zero npm dependencies.

---

## Skill bundle (what gets copied)

| Path | Required |
|---|---|
| `SKILL.md` | yes |
| `DESIGN.md` | yes |
| `references/` | yes |
| `templates/` | yes |
| `slides/` | recommended |

---

## Install targets

| Agent | User (global) | Project-local |
|---|---|---|
| **Cursor** | `~/.cursor/skills/motion-arch-slide/` | `.cursor/skills/motion-arch-slide/` |
| **Claude Code** | `~/.claude/skills/motion-arch-slide/` | `.claude/skills/motion-arch-slide/` |
| **Codex** | `~/.codex/skills/motion-arch-slide/` | user scope only |

---

## Other methods

**Git clone + npm script:**

```bash
git clone https://github.com/jiruibabaya/motion-arch-slide.git
cd motion-arch-slide
npm run install-skill
```

**Shell wrappers** (call the same Node CLI):

```powershell
.\scripts\install-skill.ps1 -Scope project
```

```bash
./scripts/install-skill.sh --scope project --agents cursor,claude
```

**Codex skill-installer:**

```bash
python "$CODEX_HOME/skills/.system/skill-installer/scripts/install-skill-from-github.py" \
  --repo jiruibabaya/motion-arch-slide --path . --name motion-arch-slide
```

---

## Verify

1. Target folder contains `SKILL.md`, `references/`, `templates/`.
2. New agent turn → `@motion-arch-slide` or ask for a slide using the skill.
3. Agent reads `DESIGN.md`; canvas has no `backdrop-filter`.

---

## Update

Re-run `npx motion-arch-slide` (or `npm run install-skill` from a pulled clone).

---

## Publish to npm (maintainers)

**One-time:** create an [npm access token](https://www.npmjs.com/settings/~tokens) (type: **Automation** or **Publish**).

**Option A — local:**

```bash
npm login
cd motion-arch-slide
npm publish --access public
```

**Option B — GitHub Actions:** add repo secret `NPM_TOKEN`, then run workflow **Publish npm** (Actions tab) or push tag `v1.0.0`.

After publish:

```bash
npx motion-arch-slide
```

---

# 安装说明（中文）

## 推荐：npx 一行安装

```bash
npx motion-arch-slide
# 或未发 npm 前：
npx github:jiruibabaya/motion-arch-slide
```

```bash
npx motion-arch-slide --scope project
npx motion-arch-slide --agents cursor,claude
npx motion-arch-slide info
```

需要 Node.js 18+。

## 装到哪里

| Agent | 用户目录 | 项目目录 |
|---|---|---|
| Cursor | `~/.cursor/skills/motion-arch-slide/` | `.cursor/skills/motion-arch-slide/` |
| Claude Code | `~/.claude/skills/motion-arch-slide/` | `.claude/skills/motion-arch-slide/` |
| Codex | `~/.codex/skills/motion-arch-slide/` | — |

## 更新

再执行一次 `npx motion-arch-slide` 即可覆盖更新。
