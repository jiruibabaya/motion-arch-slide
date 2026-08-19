<div align="center">

# motion-arch-slide

[English](README.md) · **简体中文**

**面向 Claude / Codex / Cursor 的 Agent Skill：全屏动画架构 slide（HTML/CSS/SVG，零构建）**

<br />

[![License: MIT](https://img.shields.io/badge/License-MIT-0e7490?style=for-the-badge)](LICENSE)
[![npm](https://img.shields.io/badge/npx-motion--arch--slide-ea580c?style=for-the-badge)](https://www.npmjs.com/package/motion-arch-slide)
[![Agent Skill](https://img.shields.io/badge/type-Agent%20Skill-059669?style=for-the-badge)](SKILL.md)

[安装](#安装) · [SKILL.md](SKILL.md) · [设计规范](DESIGN.md)

</div>

---

## 预览

<p align="center">
  <img src="assets/preview.png" alt="架构讲解页示例" width="920" />
</p>

<p align="center">
  <sub>参考成片：<code>slides/deepseek-harness-v3.html</code> — 浏览器直接打开</sub>
</p>

---

## 是什么

可安装的 **Agent Skill**，统一规范：画哪种图、语义配色、布局禁忌、动画契约。  
适用于录屏讲解页，单 HTML 零构建。

---

## 安装

### 推荐：`npx` 一行命令（无需 clone）

```bash
npx motion-arch-slide
```

尚未发布 npm 时，从 GitHub 直接运行：

```bash
npx github:jiruibabaya/motion-arch-slide
```

**常用选项：**

```bash
# 只装 Cursor + Claude
npx motion-arch-slide --agents cursor,claude

# 装到当前项目（团队共享）
npx motion-arch-slide --scope project

# 查看会装到哪些目录（不写入）
npx motion-arch-slide info
```

需要 Node.js 18+。安装到 Cursor / Claude Code / Codex 的用户 skill 目录。

### 其他方式

```bash
git clone https://github.com/jiruibabaya/motion-arch-slide.git
cd motion-arch-slide
npm run install-skill
# 或 .\scripts\install-skill.ps1
```

详见 [INSTALL.md](INSTALL.md)

### 安装后

| Agent | 调用 |
|---|---|
| **Cursor** | `@motion-arch-slide` |
| **Claude Code** | `@motion-arch-slide`（从 `~/.claude/skills/` 加载） |
| **Codex** | 下一轮对话自动加载 `~/.codex/skills/motion-arch-slide/` |

**更新 Skill：** 再跑一遍 `npx motion-arch-slide`

---

## 包结构

```
motion-arch-slide/
├── SKILL.md · DESIGN.md · INSTALL.md
├── bin/motion-arch-slide.js    ← npx 入口
├── references/ · templates/ · slides/
└── package.json
```

---

## 许可证

[MIT](LICENSE) © 2026 [jiruibabaya](https://github.com/jiruibabaya)
