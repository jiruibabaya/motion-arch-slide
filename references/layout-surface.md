# 布局与内容面

## 视口

```css
html, body { width:100%; height:100%; overflow:hidden; }
.deck {
  display: grid;
  grid-template-columns: 40% 1fr;
  grid-template-rows: 1fr var(--bar-h);
  width: 100vw; height: 100vh; height: 100dvh;
}
```

## 全局网格（唯一背景）

- 层：`<div class="grid-bg">` `position:fixed; inset:0; z-index:0`
- 实现：`repeating-linear-gradient` 100px 周期（0 粗线 + 20/40/60/80 细线）
- **禁止**：SVG pattern tile 拼接；各栏各自 `background-image`；`narrative/chapters` 的 `border` 压网格

## Surface token（定稿默认值）

```css
--surface-solid: rgba(255, 255, 255, 0.78);   /* 节点 */
--surface-canvas: rgba(255, 255, 255, 0.6);   /* 架构图底板 — 用户定稿 60% */
--surface-footer: rgba(255, 255, 255, 0.38);  /* 底栏 */
--surface-chip: rgba(236, 254, 255, 0.62);    /* 青 tint pill */
--surface-blur: 8px;                            /* 节点/chip 可用；canvas 禁用 blur */
```

### Canvas 透明度调参注意

- 只改 `--surface-canvas` alpha
- **不要**给 `.canvas` 加 `backdrop-filter`（会糊白网格，alpha 失效）
- 用户常见偏好区间：0.15–0.6

## 文字点缀（禁止整块白 panel）

| 类 | 用途 |
|---|---|
| `.chip` | eyebrow、pipeline 步骤、当前章节 |
| `.text-strip` | 正文 lead：左色条 + 渐变淡出 |
| `.line-highlight` | 行内标题高亮（box-decoration-break: clone） |
| `.text-glow` | 大标题 text-shadow，无背景盒 |
| `.meta` | 副标题小 pill |

左栏结构示例：

```html
<aside class="narrative">
  <div class="eyebrow chip">…</div>
  <h1>…</h1>
  <p class="lead text-strip">…</p>
  <div class="pipeline"><span class="step">…</span>…</div>
</aside>
```

## 节点定位

- `left` / `top` 用 **百分比**，相对 `#canvas`
- 同层节点固定 `min-height`，避免连线漂移
- `resize` / `load` 触发路径重算

## 连线路由

| 场景 | 函数模式 |
|---|---|
| 上 → 下汇流 | busY 正交折线 |
| 同高 | 水平 `M x1 y L x2 y` |
| 回环 | 左侧 `laneX` 纯直角，禁止斜线穿节点 |

端点 padding：`PAD = 8` px，箭头不刺穿边框。

## 底栏章节

- 无 `border-top` / 按钮 `border-right`（防叠网格）
- 当前项：`background: var(--surface-chip)` + `inset 0 2px 0 var(--c-entry)`

## 验收（布局相关）

- [ ] 左/中/底无 layout border 造成的加粗线
- [ ] 网格全屏连续
- [ ] 左栏无整块矩形白底
- [ ] canvas 60% 白底可见且网格可透
- [ ] 节点文字对比度可读（节点 solid ≥ 0.78）
