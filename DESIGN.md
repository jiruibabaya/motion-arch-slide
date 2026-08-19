# Motion Arch Slide — 设计约束汇总



> 目标：单文件 HTML，全屏 PPT 式演示页，架构图虚线流动 + 光点 hop。  

> **Skill 入口**：[`SKILL.md`](SKILL.md) · **模板**：[`templates/slide-architecture.html`](templates/slide-architecture.html) · **成片**：[`slides/deepseek-harness-v3.html`](slides/deepseek-harness-v3.html)



## 参考开源项目



| 项目 | 吸收 | 不吸收 |

|---|---|---|

| [dashmotion](https://github.com/csthink/dashmotion) | dash 周期、语义色、pause/reduced-motion | 深色 landing 默认 |

| [abergs/animations](https://github.com/abergs/animations) | 正交线、分组 dashed | GSAP 依赖 |

| [timepress-video](https://github.com/chenxihuang1028-a11y/timepress-video) | 一屏一锚点 | GSAP 时间轴 |



## 画幅与布局（硬约束）



1. **撑满视口**：`100vw × 100vh`，`overflow: hidden`。

2. **PPT 分栏**：左 40% 叙事 + 右架构图 + 底栏章节。

3. **整面网格**：全局 `repeating-linear-gradient`（20px 细 / 100px 粗），`fixed` 单层；**禁止**分区背景、layout border。

4. **架构图底板**：`--surface-canvas: rgba(255,255,255,0.6)`（定稿）；canvas **禁止** backdrop-filter。

5. **文字面**：chip / text-strip / line-highlight；**禁止**左栏整块白 panel。

6. **连线**：正交；回环侧 lane；resize 重算路径。

7. **录屏周期**：0.75s / 1.5s / 3s。



## 语义色（摘要）



| class | 色 | 用途 |

|---|---|---|

| entry | `#0e7490` | 入口、主流程边 |

| core | `#ea580c` | 运行时核心 |

| cap / log | `#059669` | 能力、持久化 |

| client | 灰 | UI/呈现 |



详见 [`references/semantic-colors.md`](references/semantic-colors.md)



## Surface token（定稿）



```css

--surface-solid: rgba(255, 255, 255, 0.78);

--surface-canvas: rgba(255, 255, 255, 0.6);

--surface-footer: rgba(255, 255, 255, 0.38);

--surface-chip: rgba(236, 254, 255, 0.62);

```



## 图表类型



架构 / 流程 / 时序 / 部署 / 状态 → [`references/diagram-types.md`](references/diagram-types.md)



## 动画



[`references/animation-contract.md`](references/animation-contract.md) — dash 6+6 / offset -12；SMIL journey 3–5 光点。



## 项目结构



```

motion-arch-slide/

├── SKILL.md

├── AGENTS.md

├── INSTALL.md

├── DESIGN.md

├── templates/slide-architecture.html

├── references/

├── slides/deepseek-harness-v3.html

└── scripts/install-skill.*

```



## 验收清单



- [ ] 全屏无滚动条

- [ ] 无 layout border 叠网格线

- [ ] 无连线穿节点

- [ ] dash 无跳帧；光点与 path 重合

- [ ] reduced-motion 静态可读

- [ ] canvas 60% 底、左栏无整块白盒

- [ ] 单文件、无构建、双击可开

