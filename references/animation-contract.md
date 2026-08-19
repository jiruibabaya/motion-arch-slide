# 动画契约

## 虚线流动（CSS）

```css
@media (prefers-reduced-motion: no-preference) {
  .flow-entry, .flow-core, .flow-cap, .flow-loop {
    stroke-dasharray: 6 6;
    animation: dash 0.75s linear infinite;
  }
  .flow-loop { animation-duration: 1s; } /* 回环可略慢 */
}
@keyframes dash { to { stroke-dashoffset: -12; } }
```

**铁律**：`|stroke-dashoffset| === dash + gap`（此处 6+6=12），否则循环跳帧。

录屏周期：0.75s / 1.5s / 3s 均可无缝 loop。

## 光点（SVG SMIL）

```xml
<circle r="4.5" fill="{语义色}">
  <animateMotion dur="1.2s" repeatCount="indefinite" path="{与可见 path 相同的 d}" begin="0s"/>
</circle>
```

- `path` 属性必须与 `<path d="...">` **完全一致**（可复用 JS 变量）
- Journey：链式 `begin="dotA.end+0.2s"`，每屏 **3–5** 个光点
- `prefers-reduced-motion: reduce` → 不创建 animateMotion

## 暂停

```javascript
document.body.classList.toggle("paused");
// CSS: body.paused .flow-* { animation-play-state: paused; }
// SVG: svg.pauseAnimations() / unpauseAnimations()
```

快捷键：Space 暂停，F 全屏。

## 每屏动画预算

| 元素 | 上限 |
|---|---|
| animate 的边 | 4–6 条 |
| 光点 | 3–5 个 |
| journey 链 | 1–2 条 |

## 禁止

- 每条边各放一个光点（噪）
- dash 周期与 offset 不匹配
- 光点 path 与可见线不一致
- reduced-motion 仍强制动画

## 参考

- [dashmotion](https://github.com/csthink/dashmotion) dash 周期约定
- 成片实现：`slides/deepseek-harness-v3.html` 内 `addPath` / `addDot` / `layout()`
