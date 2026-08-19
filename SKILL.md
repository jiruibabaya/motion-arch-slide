---
name: motion-arch-slide
description: >-
  Creates full-viewport HTML presentation slides with animated architecture/flow
  diagrams (CSS dash flow + SVG animateMotion), semantic node colors, grid
  background, and editorial text surfaces. Use when the user asks for architecture
  walkthrough slides, system diagram animations, PPT-style HTML decks, DeepSeek-style
  explainer pages, or choosing between architecture vs flowchart vs sequence diagrams.
  Install: npx motion-arch-slide  (or npx github:jiruibabaya/motion-arch-slide)
---

# Motion Arch Slide

单文件 HTML 演示页：左文右图 + 底栏章节 + 网格背景 + 虚线流动 + 光点 journey。  
**零构建依赖**，双击或 `file://` 可开。参考成片：`slides/deepseek-harness-v3.html`。

## 何时启用本 Skill

- 要做**全屏讲解页 / 录屏用 slide / 架构 walkthrough**
- 要在 HTML 里画**会动的**系统图（虚线 + 光点）
- 用户问「用架构图还是流程图 / 时序图 / 部署图」
- 要统一**节点语义色**、网格背景、文字点缀面

## 快速决策：画哪种图

| 用户意图 | 用哪种 | 布局特征 | 动画 |
|---|---|---|---|
| 系统有哪些部件、谁连谁、分层/分组 | **架构图** (C4/组件级) | 分组框 + 正交连线；左→中→右 或 上→中→下 | 虚线沿**数据/控制主路径** flow |
| 一步接一步怎么做、分支判断 | **流程图** | 单列/双列节点；菱形决策少用（HTML 手工贵） | 沿**主流程**单链 journey，分支静态高亮 |
| 一次请求经手哪些角色、时间顺序 | **时序图** | 竖向生命线 + 水平消息；不用架构节点样式 | 消息线 dash；光点沿**一条请求链** |
| 机器/进程/副本怎么分布 | **部署图** | 虚线区域 = 环境/可用区；节点贴区 | ingress→service 一条 flow |
| 状态怎么变 | **状态图** | 圆角节点 + 标注事件 | 只 animate **happy path** |
| 纯概念对比、无拓扑 | **文字 slide** | 无 canvas 或仅图标 | 可不要动画 |

**默认**：讲后端/Agent/平台 → **架构图**。讲操作步骤/审批 → **流程图**。讲 RPC/WS 一轮 → **时序图**。

详细决策树与反例 → [references/diagram-types.md](references/diagram-types.md)

## 生产工作流

```
1. 定类型 → diagram-types.md 确认
2. 列章节（底栏 4–8 项）与当前页「一屏一锚点」
3. 列节点表：id / 语义类 / 标题 / 相对位置
4. 列边表：from → to / 语义类 / 路由规则
5. 复制 templates/slide-architecture.html（或 v3 改）
6. 填左栏叙事（chip + text-strip，禁止整块白 panel）
7. 填 canvas 节点 + JS 路由
8. 跑验收清单（DESIGN.md 末）
9. 输出到 slides/{topic}-vN.html
```

## 语义色（架构图必遵）

节点 **CSS class** 与 **边 class** 成对，禁止随意配色。

| 语义 class | 节点用途 | 主色 token | 边 class |
|---|---|---|---|
| `entry` | 入口、客户端、API gateway | `--c-entry` 青 `#0e7490` | `flow-entry` |
| `core` | 运行时、编排器、Domain 核心 | `--c-core` 橙 `#ea580c` | `flow-core` |
| `cap` | 能力、适配器、插件、外部工具 | `--c-cap` 绿 `#059669` | `flow-cap` |
| `log` | 日志、事件流、持久化、审计 | `--c-cap` 绿（与 cap 同系） | `flow-core` 或 `flow-cap` |
| `client` | UI/呈现层、消费方 | 灰 `#64748b` 边框 | `flow-entry` |
| `neutral` | 存储、队列、第三方（无强语义） | `--c-muted` | `flow-entry` |
| `warn` | 降级、限流、人工审批 | `#b45309` | 虚线 optional |

扩展映射（数据库/K8s/消息队列）→ [references/semantic-colors.md](references/semantic-colors.md)

## 布局硬约束（已验证）

1. **网格**：全局一层 `fixed` + `repeating-linear-gradient`（20px 细 / 100px 粗），**禁止**分区铺背景、**禁止** layout `border` 压网格（会叠线）。
2. **架构图底板**：`.canvas { background: var(--surface-canvas) }`，默认 **`rgba(255,255,255,0.6)`**，**禁止**对 canvas 用 `backdrop-filter`（alpha 调了也看不出）。
3. **文字面**：分层点缀——`chip` / `text-strip` / `line-highlight` / `text-glow`；**禁止**左栏整块 `.surface--panel` 大白盒。
4. **连线**：正交折线；同层水平直连；回环走**侧向 lane**，禁止贝塞尔斜穿节点。
5. **节点**：`position:absolute` + `%` 定位；`resize` 重算 SVG；节点不透明白底遮线头。

细节 → [references/layout-surface.md](references/layout-surface.md)

## 动画契约（非协商）

```css
.flow-* { stroke-dasharray: 6 6; animation: dash 0.75s linear infinite; }
@keyframes dash { to { stroke-dashoffset: -12; } }  /* 周期 = dash+gap */
```

- 光点：`animateMotion` 沿**同一条** path d；链式 `begin` 做 journey，每屏 3–5 个光点。
- `@media (prefers-reduced-motion: reduce)` 关动画；提供 Space 暂停 / F 全屏。
- 完整契约 → [references/animation-contract.md](references/animation-contract.md)

## 文件结构

```
motion-arch-slide/
├── SKILL.md                 ← 本文件
├── DESIGN.md                ← 设计约束 + 验收清单
├── templates/
│   └── slide-architecture.html
├── references/
│   ├── diagram-types.md
│   ├── semantic-colors.md
│   ├── layout-surface.md
│   └── animation-contract.md
└── slides/
    └── deepseek-harness-v3.html   ← 参考成片
```

## Agent 执行要点

1. **先读** `DESIGN.md` + 对应 reference，再写 HTML。
2. **从模板复制**，不要从零搭网格/动画。
3. 新 slide 命名 `slides/{kebab-topic}-v1.html`；大改递增 vN。
4. 改完对照 DESIGN.md 验收清单；录屏场景周期用 0.75s / 1.5s / 3s。
5. 用户未指定 canvas 透明度时保持 **`--surface-canvas: 0.6`**。
6. 流程图 variant：节点改单列布局，边用 `flow-core` 单链，仍用同一套 token。

## 安装（Agent Skill）

```bash
# 推荐：无需 clone
npx motion-arch-slide
# 或未发布 npm 前：
npx github:jiruibabaya/motion-arch-slide

# 项目内共享
npx motion-arch-slide --scope project

# 预览安装路径
npx motion-arch-slide info
```

也可 `git clone` 后 `npm run install-skill`。详见 [INSTALL.md](INSTALL.md)。

| Agent | 用户目录 | 项目目录 |
|---|---|---|
| Cursor | `~/.cursor/skills/motion-arch-slide/` | `.cursor/skills/motion-arch-slide/` |
| Claude Code | `~/.claude/skills/motion-arch-slide/` | `.claude/skills/motion-arch-slide/` |
| Codex | `~/.codex/skills/motion-arch-slide/` | — |

**调用：** `@motion-arch-slide` · **更新：** 再跑一遍 `npx motion-arch-slide`

## 参考开源

| 项目 | 用途 |
|---|---|
| [dashmotion](https://github.com/csthink/dashmotion) | dash 周期、语义色、pause |
| [abergs/animations](https://github.com/abergs/animations) | 正交线、分组 dashed |
| [timepress-video](https://github.com/chenxihuang1028-a11y/timepress-video) | 一屏一锚点 |
