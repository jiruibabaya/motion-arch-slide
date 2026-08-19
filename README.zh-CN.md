<div align="center">

# motion-arch-slide

English · [**简体中文**](README.zh-CN.md)

**可安装的 Agent Skill — 为 Cursor、Claude Code、Codex 生成全屏动画架构讲解页**

单文件 HTML · CSS 虚线流动 · SVG 光点 · 零构建

<br />

[![npm version](https://img.shields.io/npm/v/motion-arch-slide?style=for-the-badge&color=ea580c)](https://www.npmjs.com/package/motion-arch-slide)
[![License: MIT](https://img.shields.io/badge/License-MIT-0e7490?style=for-the-badge)](LICENSE)
[![Node](https://img.shields.io/badge/node-%3E%3D18-059669?style=for-the-badge)](https://nodejs.org)

```bash
npx motion-arch-slide
```

[安装](#安装) · [使用](#使用) · [文档](#文档) · [npm](https://www.npmjs.com/package/motion-arch-slide)

</div>

---

## 预览

<p align="center">
  <img src="assets/preview.png" alt="架构讲解页 — 左栏叙事、动画架构图、底栏章节" width="920" />
</p>

<p align="center">
  参考成片：<code>slides/deepseek-harness-v3.html</code> — 浏览器直接打开（<code>file://</code> 即可）
</p>

---

## 是什么

**motion-arch-slide** 不是 slide 框架，而是教 Agent **怎么规范地画**录屏用架构讲解页：

| Skill 里写死的规则 | 作用 |
|---|---|
| 架构图 / 流程图 / 时序图怎么选 | 避免图类型用错 |
| 语义配色（`entry` / `core` / `cap`） | 节点一眼可辨 |
| 布局硬约束（网格、surface、正交连线） | 避开已验证的踩坑 |
| 动画契约（dash + `animateMotion`） | 不用 GSAP 也能流畅 |

附带**可复制模板**和**参考成片**（DeepSeek Harness 拆解风格）。

---

## 安装

需要 **[Node.js 18+](https://nodejs.org)**。

```bash
npx motion-arch-slide
```

| 选项 | 说明 |
|---|---|
| `npx motion-arch-slide info` | 只看安装路径，不写入 |
| `npx motion-arch-slide --agents cursor,claude` | 只装指定 Agent |
| `npx motion-arch-slide --scope project` | 装到当前项目（团队共享） |

**默认安装位置（用户级）：**

| Agent | 路径 |
|---|---|
| Cursor | `~/.cursor/skills/motion-arch-slide/` |
| Claude Code | `~/.claude/skills/motion-arch-slide/` |
| Codex | `~/.codex/skills/motion-arch-slide/` |

更多方式 → [INSTALL.md](INSTALL.md)

**更新 Skill：** 再执行一次 `npx motion-arch-slide`。

---

## 使用

1. **安装**（见上），开**新一轮** Agent 对话。
2. 调用 Skill：
   - Cursor / Claude Code：`@motion-arch-slide`
   - 或说明：「用 motion-arch-slide 给 xxx 做一页架构 slide」
3. Agent 读 `SKILL.md`、`DESIGN.md`，从 `templates/slide-architecture.html` 复制出片。
4. 本地浏览器打开 HTML，无需起服务。

**示例 prompt：**

> 用 motion-arch-slide，给 noetix-server 主链路做一页架构 slide，从 WebSocket 到 TTS，底栏 6 章。

---

## 文档

| 文件 | 内容 |
|---|---|
| [SKILL.md](SKILL.md) | Agent 工作流、图表决策、语义色 |
| [DESIGN.md](DESIGN.md) | 硬约束 + 验收清单 |
| [INSTALL.md](INSTALL.md) | 安装方式、参数、验证 |
| [AGENTS.md](AGENTS.md) | Codex / 通用 Agent 入口 |
| [references/](references/) | 图表类型、配色、布局、动画细则 |

---

## 仓库结构

```
motion-arch-slide/
├── SKILL.md                 # Agent 入口
├── bin/motion-arch-slide.js # npx CLI
├── templates/               # 新 slide 从此复制
├── slides/                  # 参考成片
├── references/              # Skill 参考文档
└── scripts/                 # 可选安装脚本
```

---

## 本地开发

```bash
git clone https://github.com/jiruibabaya/motion-arch-slide.git
cd motion-arch-slide
npm run install-skill
npm test
```

---

## 许可证

[MIT](LICENSE) © 2026 [jiruibabaya](https://github.com/jiruibabaya)
