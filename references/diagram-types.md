# 图表类型选择

## 决策树

```
要讲什么？
├─ 「系统由哪些部分组成、如何连接」→ 架构图 (architecture)
├─ 「按步骤怎么做 / 如果则」→ 流程图 (flowchart)
├─ 「A 调用 B 再回调 C、按时间」→ 时序图 (sequence)
├─ 「跑在哪个集群/区域/容器」→ 部署图 (deployment)
├─ 「对象在哪些状态间切换」→ 状态图 (state)
└─ 「两个方案对比 / 纯观点」→ 文字 slide（可无 diagram）
```

## 架构图 (Architecture)

**适用**

- 平台总览、模块边界、数据/control plane 分离
- 多入口共用一个 runtime（Harness 类）
- 录屏「系统怎么拼起来」

**不适用**

- 逐步操作手册（用流程图）
- 单次 HTTP 调用的消息顺序（用时序图）

**本 Skill 默认布局**

- 左栏 40% 叙事 + 右栏 canvas
- 节点 6–12 个/屏；超过则拆章节
- 分组：`group-shell` 虚线框（如 ENTRY POINTS）
- 边：正交 + 语义色 dash

**动画**

- 1 条主 journey（入口 → 核心 → 能力 → 日志）
- 可选 1 条回环（Session → Clients），走侧 lane

## 流程图 (Flowchart)

**适用**

- 请求处理步骤、发布流程、故障处理步骤
- 用户问「接下来会发生什么」

**布局变体**（仍用同一 HTML 模板）

- canvas 内节点**纵向或 Z 字**排列（`top: 15% / 35% / 55% …`）
- 决策点：用 `node warn` + 文字说明，避免真菱形（CSS 成本高）
- 分支：只 **animate 主路径**；备选路径静态虚线

**动画**

- 单链 `flow-core`，光点 3–4  hop 链式 `begin`

## 时序图 (Sequence)

**适用**

- WebSocket 一轮、RPC 链、插件回调顺序

**实现要点**

- 不用 `.node.entry` 卡片风；改 **lifeline 竖线** + **水平 message**（细矩形或纯 path）
- 参与者 3–6 个；消息 label 用 `line-highlight` 小条
- 动画：沿消息 path dash；光点只跟 **critical path**（≤4 条消息）

**何时不用本 Skill 模板**

- 消息 >10 条且需泳道 → 考虑 Mermaid 导出静态图嵌入，或单独 sequence 模板（未来扩展）

## 部署图 (Deployment)

**适用**

- K8s / 多 AZ / edge + cloud

**实现**

- `group-shell` = 集群/Namespace（label 写环境名）
- 节点 `entry`=ingress, `core`=service, `cap`=DB/Redis, `neutral`=worker
- 边：ingress → service → data，单色系 `flow-entry`

## 状态图 (State)

**适用**

- 连接状态、任务状态机

**实现**

- 节点 `neutral` 或 `core`；边 label 写事件名
- **不要**全图 animate；只高亮默认路径 1 条 chain

## 一屏原则

- 每章 slide **一个认知锚点**（timepress / DeepSeek 风）
- 动画服务锚点，不服务每条边
- 信息过多 → 拆底栏章节，不要缩小字号硬塞

## 反例

| 错误 | 应用 |
|---|---|
| 把 20 步操作画成架构图 | 流程图 |
| 架构图里画 UML 全时序 | 时序图或拆页 |
| 同一屏 3 种 journey 光点乱飞 | 最多 2 条 journey |
| C4 Context 和 Component 混在一屏 | 两章 |
