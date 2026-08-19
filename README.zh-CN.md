<div align="center">



# motion-arch-slide



[**English**](README.md) · **简体中文**



**全屏 HTML 架构讲解页 — 零构建，浏览器直接打开。**



CSS 虚线流动 · SVG 光点 journey · 语义化节点配色 · Cursor Agent Skill



<br />



[![License: MIT](https://img.shields.io/badge/License-MIT-0e7490?style=for-the-badge)](LICENSE)

[![在线演示](https://img.shields.io/badge/demo-GitHub%20Pages-ea580c?style=for-the-badge)](https://jiruibabaya.github.io/motion-arch-slide/)

[![Cursor Skill](https://img.shields.io/badge/Cursor-Skill-059669?style=for-the-badge)](SKILL.md)



[**在线演示**](https://jiruibabaya.github.io/motion-arch-slide/demo/deepseek-harness-v3.html) · [设计规范](DESIGN.md) · [Agent 工作流](SKILL.md)



</div>



---



## 预览



<p align="center">

  <img src="assets/preview.png" alt="架构讲解页 — 左栏叙事、动画架构图、底栏章节" width="920" />

</p>



<p align="center">

  <sub>示例：<code>slides/deepseek-harness-v3.html</code> — DeepSeek Harness 架构拆解</sub>

</p>



---



## 为什么做这个项目



常见的「动画架构图」要么是**深色 landing**，要么依赖 **GSAP 时间轴**。  

本项目面向**录屏讲解 slide**：



| 你得到 | 你不需要 |

|---|---|

| 100vw × 100vh PPT 式分栏 | Webpack / Vite |

| 正交连线 + 虚线流动 | GSAP / Lottie |

| 语义色（entry / core / cap） |  diagram SaaS 导出 |

| 每章一个 HTML 文件 | 传统 slide 工具链 |



风格参考 DeepSeek Harness 类技术 walkthrough，沉淀为**可复用模板 + Cursor Skill**。



---



## 特性



- **布局** — 左 40% 叙事 · 右动画 canvas · 底栏章节 · 全局网格背景

- **动效** — CSS `stroke-dashoffset` 循环 + SVG `animateMotion` 光点链

- **语义色** — 青入口 · 橙核心 · 绿能力 · 灰客户端（[配色表](references/semantic-colors.md)）

- **路由** — 正交折线、回环走侧 lane；窗口 resize 重算路径

- **无障碍** — `prefers-reduced-motion`、Space 暂停、F 全屏

- **Agent 友好** — [SKILL.md](SKILL.md) 规定何时用架构图 / 流程图 / 时序图



---



## 快速开始



```bash

git clone https://github.com/jiruibabaya/motion-arch-slide.git

cd motion-arch-slide

```



在浏览器打开参考 slide：



- **在线：** [GitHub Pages 演示](https://jiruibabaya.github.io/motion-arch-slide/demo/deepseek-harness-v3.html)

- **本地文件：** `slides/deepseek-harness-v3.html`



或本地起服务：



```bash

python -m http.server 8765

# http://127.0.0.1:8765/slides/deepseek-harness-v3.html

```



### 做自己的 slide



1. 复制 `templates/slide-architecture.html` → `slides/my-topic-v1.html`

2. 改左栏叙事、`.node[data-id]`、底栏章节、`layout()` 里的 edges

3. 对照 [验收清单](DESIGN.md#验收清单)



---



## Cursor Skill



复制到个人 Skill 目录即可全局使用：



```text

~/.cursor/skills/motion-arch-slide/

  ├── SKILL.md

  ├── DESIGN.md

  ├── references/

  └── templates/

```



对话里 `@motion-arch-slide`。Skill 内含**图表类型决策**、**语义色**、**布局陷阱**（例如 canvas 禁止 `backdrop-filter`，否则调透明度无效）。



---



## 目录结构



```

motion-arch-slide/

├── assets/preview.png          # README 头图

├── docs/                       # GitHub Pages 站点

├── slides/                     # 成片

├── templates/                  # 复制后改

├── references/                 # 图表类型、配色、动画契约

├── scripts/capture_preview.py  # 重生成头图

├── SKILL.md                    # Cursor Agent 说明

└── DESIGN.md                   # 硬约束 + 验收

```



---



## 图表选择（简表）



| 意图 | 图表 | 详见 |

|---|---|---|

| 组件与连接关系 | 架构图 | [diagram-types.md](references/diagram-types.md) |

| 步骤 / 分支流程 | 流程图 | 同上 |

| 跨角色请求时序 | 时序图 | 同上 |

| 部署 / 副本分布 | 部署图 | 同上 |



讲后端 / Agent / 平台时，默认用**架构 slide**。



---



## GitHub Pages



站点已推送到 **`gh-pages`** 分支（每次 push `main` 也会由 Actions 同步）。



**若访问 404，请在 GitHub 启用 Pages（只需一次）：**



1. 打开仓库 **Settings → Pages**
2. **Build and deployment → Source:** Deploy from a branch
3. **Branch:** `gh-pages` · **Folder:** `/ (root)` → Save



（也可选 branch `main`、folder `/docs`。）



| 地址 | 内容 |

|---|---|

| [jiruibabaya.github.io/motion-arch-slide/](https://jiruibabaya.github.io/motion-arch-slide/) | 双语首页（**默认中文**） |

| […/demo.html](https://jiruibabaya.github.io/motion-arch-slide/demo.html) | 参考 slide |



更新 `slides/` 成片后运行 `scripts/sync-pages-demo.bat` 再 push。



---



## 致谢



- [dashmotion](https://github.com/csthink/dashmotion) — dash 周期与语义描边

- [abergs/animations](https://github.com/abergs/animations) — 正交连线模式



---



## 许可证



[MIT](LICENSE) © 2026 [jiruibabaya](https://github.com/jiruibabaya)


