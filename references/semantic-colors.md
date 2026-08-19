# 语义色与节点样式

## 设计原则

1. **颜色 = 语义**，不是装饰；一屏不超过 3 种主语义色（entry / core / cap）。
2. **边颜色跟随源或主路径语义**，见下表；同屏勿出现无语义彩虹边。
3. 节点：**顶色条 3–4px**（`::after`）+ 边框 1.5–2px + `--surface-solid` 底。
4. 核心节点可略暖底：`rgba(255, 252, 248, 0.82)`（`.node.core`）。

## CSS 变量（默认浅色主题）

```css
--c-entry: #0e7490;      /* 青：入口、主流程 */
--c-entry-soft: #ecfeff;
--c-core: #ea580c;       /* 橙：运行时核心 */
--c-core-soft: #fff7ed;
--c-cap: #059669;        /* 绿：能力、持久化、回环 */
--c-cap-soft: #ecfdf5;
--c-muted: #64748b;      /* 灰：客户端、中性 */
--c-text: #0f172a;
--c-sub: #475569;
```

## 节点 class 映射

| class | 典型实体 | 边框 | 顶条 | tag 色 |
|---|---|---|---|---|
| `.node.entry` | Web/API/SDK/网关 | `--c-entry` | entry | entry |
| `.node.core` | Orchestrator/Runtime/Domain | `--c-core` 2px | core | core |
| `.node.cap` | LLM adapter/Tool/Plugin | `--c-cap` | cap | cap |
| `.node.log` | Event log/DB/WAL/审计 | `--c-cap` | cap | cap |
| `.node.client` | UI/Console/Device | `#94a3b8` | `#64748b` | `#475569` |
| `.node.neutral` | Queue/Cache/第三方 | `#cbd5e1` | muted | muted |
| `.node.warn` | 降级/熔断/人工 | `#b45309` | warn | warn |

### 扩展实体 → class

| 实体类型 | 推荐 class |
|---|---|
| API Gateway / LB | `entry` |
| BFF / GraphQL | `entry` |
| 微服务（业务核心） | `core` |
|  sidecar / agent runtime | `core` |
| 数据库 / 对象存储 | `log` 或 `cap` |
| Kafka / Redis | `cap` 或 `neutral` |
| 外部 SaaS | `neutral` |
| Mobile / Web 前端 | `client` |
| Cron / Worker | `cap` |

## 边 (flow) class 映射

| class | stroke 色 | 用途 |
|---|---|---|
| `.flow-entry` | `--c-entry` | 入口流、客户端、control 上行 |
| `.flow-core` | `--c-core` | 核心编排、主业务流、下行日志 |
| `.flow-cap` | `--c-cap` | 能力调用、存储写入、回环 |
| `.flow-loop` | `--c-cap` 或 cap 略浅 | 反馈/异步回写（可略慢动画 1s） |
| `.flow-muted` | `#94a3b8` | 可选依赖、弱关联（静态，不 animate） |

**规则**

- 入口 → 核心：`flow-entry` 或汇流后 `flow-core`
- 核心 → 能力：`flow-cap`
- 核心 → 日志：`flow-core`
- Session/事件 → 呈现：`flow-loop` + 侧 lane 路由

## 分组框 group-shell

- 边框：1.5px dashed `rgba(14, 116, 144, 0.5)`（entry 色系）
- 背景：`rgba(255, 255, 255, 0.28)` 置于 canvas 底板之上
- label：左上角 + `--surface-solid` 小底

## 深色主题（可选变体）

仅当用户明确要求 dark slide：

- 网格 `--grid-bg: #0f172a`，线 rgba 亮 10%
- 节点底 `rgba(30, 41, 59, 0.85)`，字 `#f1f5f9`
- **语义 hue 不变**（entry/core/cap），只调明度

默认产出 **浅色 PPT 风**，与 v3 成片一致。

## 禁止

- 同一语义两种 unrelated 颜色（如两个 core 一橙一蓝）
- 用颜色区分「重要程度」而非语义（重要 = 尺寸/位置/动画，不是随机红）
- 边颜色与节点语义完全无关
