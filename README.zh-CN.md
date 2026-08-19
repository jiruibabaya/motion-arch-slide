<div align="center">

# motion-arch-slide

[English](README.md) · **简体中文**

**面向 Claude / Codex / Cursor 等 Agent 的全屏动画架构 slide Skill + 模板（HTML/CSS/SVG，零构建）。**

<br />

[![License: MIT](https://img.shields.io/badge/License-MIT-0e7490?style=for-the-badge)](LICENSE)
[![Agent Skill](https://img.shields.io/badge/type-Agent%20Skill-059669?style=for-the-badge)](SKILL.md)

[安装](#安装) · [SKILL.md](SKILL.md) · [设计规范](DESIGN.md)

</div>

---

## 预览

<p align="center">
  <img src="assets/preview.png" alt="架构讲解页示例" width="920" />
</p>

<p align="center">
  <sub>参考成片：<code>slides/deepseek-harness-v3.html</code> — 浏览器直接打开即可</sub>
</p>

---

## 是什么

一个**可安装的 Agent Skill**，让 Claude、Codex、Cursor 等工具按统一规范产出录屏用架构讲解页：

| 提供 | 不需要 |
|---|---|
| 全屏 PPT 式分栏布局 | Webpack / Vite |
| 虚线流动 + 光点 journey | GSAP / Lottie |
| 语义化节点配色 | 每次手调颜色 |
| 每章单 HTML 文件 | 专用 slide 工具链 |

Skill 里写死了：**画哪种图、用什么色、哪些布局不能碰、动画怎么接** — 不只是空模板。

---

## 安装

```bash
git clone https://github.com/jiruibabaya/motion-arch-slide.git
cd motion-arch-slide
```

**Windows（PowerShell）** — 一次装到 Cursor、Claude Code、Codex 用户目录：

```powershell
.\scripts\install-skill.ps1
```

**macOS / Linux：**

```bash
chmod +x scripts/install-skill.sh
./scripts/install-skill.sh
```

**仅当前项目**（团队仓库共享）：

```powershell
.\scripts\install-skill.ps1 -Scope project
```

**Codex**（内置安装器）：

```bash
python ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo jiruibabaya/motion-arch-slide --path . --name motion-arch-slide
```

完整说明 → [INSTALL.md](INSTALL.md)

### 安装后怎么用

| Agent | 调用方式 |
|---|---|
| **Cursor** | `@motion-arch-slide` 或说明「用 motion-arch-slide skill」 |
| **Claude Code** | 从 `~/.claude/skills/` 自动加载；或 `@motion-arch-slide` |
| **Codex** | 装到 `~/.codex/skills/` 后下一轮生效 |

---

## Skill 包结构

```
motion-arch-slide/
├── SKILL.md              ← Agent 入口（必需）
├── DESIGN.md             ← 硬约束 + 验收清单
├── INSTALL.md            ← 各 Agent 安装路径
├── references/           ← 图表类型、配色、动画、布局
├── templates/            ← 新 slide 从此复制
├── slides/               ← 参考成片
└── scripts/install-skill.*
```

---

## 人工快速开始

1. 先安装 Skill，让 Agent 遵守规范。
2. 复制 `templates/slide-architecture.html` → `slides/my-topic-v1.html`
3. 改叙事、节点、连线、底栏章节。
4. 浏览器打开 HTML，`file://` 即可，无需服务器。

---

## 许可证

[MIT](LICENSE) © 2026 [jiruibabaya](https://github.com/jiruibabaya)
