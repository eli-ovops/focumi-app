# Focumi v0.6 Existing Pet Asset Audit + Animation Map

> 日期：2026-08-13  
> 状态：只读审计完成，等待用户确认  
> 输入边界：当前工作区资产、源码引用、用户指定截图中的两只角色  
> 本轮未做：修改 App、修改角色、生成新 Concept、生成动画、删除或覆盖资产

## 0. 结论

Focumi v0.6 的正式角色恢复为：

- **Milo**：橘色虎斑猫，鼠尾草绿色领巾，手绘纸本质感；
- **Max**：黑白哈士奇幼犬，灰蓝格纹领巾，手绘纸本质感。

与用户指定截图匹配的权威资产族是：

- App：`FocumiMilo*` / `FocumiMax*`
- Live Activity：`FocumiMiloLA*` / `FocumiMaxLA*`
- Shield：`FocumiMiloShieldPortrait` / `FocumiMaxShieldPortrait`

两只角色已有较完整的**静态状态覆盖**，但没有以该正式造型制作的真正逐帧动画。当前 `PetFrameAnimation` 中可播放的四组帧属于更早的 3D 连帽衫角色，视觉身份与用户指定形象不一致，不能直接回到正式 UI。

核心生产策略应是：

> 保留 Milo / Max 现有正式静态造型，沿用已验证的 performance state 与播放架构，为这些造型补做连续动作帧。

## 1. 正式视觉身份

| 项目 | Milo | Max |
|---|---|---|
| 正式名称 | Milo | Max |
| 物种 | 橘色虎斑猫 | 黑白哈士奇幼犬 |
| 主色与花纹 | 暖橘虎斑、浅色口鼻/胸腹 | 黑白面罩、额中白色识别区、白胸与白爪 |
| 配饰 | 鼠尾草绿色领巾 | 灰蓝色格纹领巾 |
| 基础比例 | 圆润幼猫、低重心、短猫爪、粗尾 | 幼犬比例、直立耳、宽犬爪、短而蓬松的尾巴 |
| 画面语言 | 暖色手绘线条、纸张/彩铅纹理 | 与 Milo 同世界的手绘线条、纸张/彩铅纹理 |
| 必须保持 | 额头虎斑、圆脸、领巾、猫科爪与尾巴 | 黑白面罩、额中白纹、耳形、领巾、犬科宽爪 |

### 1.1 明确退出正式 production 的路线

下列内容在本报告中统一视为：

`DEPRECATED_CHARACTER_REDESIGN_EXPLORATION`

- Gate 1 新 Milo Concept / Model Sheet；
- Max Husky exploration；
- Toto Pomeranian exploration / Concept；
- Milo & Toto 新组合及相关锁定；
- Toto App、Live Activity、Shield 派生资产。

本轮没有修改、重命名、删除或覆盖这些历史文件。

## 2. 正式 App 资产清单

根目录：

`DisciplinedPet/Resources/FocumiAppVintage.xcassets`

### 2.1 Milo

| 状态 | Asset | 文件 | 当前用途判断 |
|---|---|---|---|
| Idle | `FocumiMiloIdle` | `milo_idle_v1.png` | 正式身份基准；可直接作为静态/Reduce Motion 落点 |
| Pact | `FocumiMiloPact` | `milo_pact_v1.png` | 目标输入/注意目标的静态关键姿态 |
| Start | `FocumiMiloStart` | `milo_start_v1.png` | Start 动作中的接触关键姿态，不是完整动画 |
| Focus | `FocumiMiloFocus` | `milo_focus_v2.png` | Focus 静态主姿态/循环落点 |
| Waiting | `FocumiMiloWaiting` | `milo_waiting_v1.png` | Waiting 静态主姿态/Return 起点候选 |
| Return | `FocumiMiloReturn` | `milo_return_v1.png` | Return 中段或终点关键姿态，不是连续动作 |
| Complete | `FocumiMiloComplete` | `milo_complete_v1.png` | Completion 盖章关键姿态 |
| Tap | `FocumiMiloTap` | `milo_tap_v1.png` | Tap Response 的单张响应姿态 |
| Gentle End | `FocumiMiloCancel` | `milo_cancel_v1.png` | 柔和结束静态落点 |

### 2.2 Max

| 状态 | Asset | 文件 | 当前用途判断 |
|---|---|---|---|
| Idle | `FocumiMaxIdle` | `max_idle_v1.png` | 正式身份基准；可直接作为静态/Reduce Motion 落点 |
| Pact | `FocumiMaxPact` | `max_pact_v1.png` | 目标输入/注意目标的静态关键姿态 |
| Start | `FocumiMaxStart` | `max_start_v1.png` | Start 动作中的接触关键姿态，不是完整动画 |
| Focus | `FocumiMaxFocus` | `max_focus_v2.png` | Focus 静态主姿态/循环落点 |
| Waiting | `FocumiMaxWaiting` | `max_waiting_v1.png` | Waiting 静态主姿态/Return 起点候选 |
| Return | `FocumiMaxReturn` | `max_return_v1.png` | Return 中段或终点关键姿态，不是连续动作 |
| Complete | `FocumiMaxComplete` | `max_complete_v1.png` | Completion 盖章关键姿态 |
| Tap | `FocumiMaxTap` | `max_tap_v1.png` | Tap Response 的单张响应姿态 |
| Gentle End | `FocumiMaxCancel` | `max_cancel_v1.png` | 柔和结束静态落点 |

### 2.3 当前使用冲突

当前 `PetAvatarView.swift` 的表现映射存在两项与新决策冲突：

1. `.dog` 被直接映射到 `FocumiTotoConceptStatic`；
2. `CompanionPresentation.swift` 将 `.dog` 用户可见名称与描述映射为 Toto / Pomeranian。

这是后续实现时必须修正的表现层问题；本轮只记录，没有修改。

## 3. Live Activity 与 Shield 资产

### 3.1 Live Activity

根目录：

`DisciplinedPetLiveActivity/Resources/FocumiLiveActivityVintage.xcassets`

| 角色 | Focus | Waiting | Returning | 可用性 |
|---|---|---|---|---|
| Milo | `FocumiMiloLAFocus` | `FocumiMiloLAWaiting` | `FocumiMiloLAReturning` | 三态静态图齐全，可继续使用 |
| Max | `FocumiMaxLAFocus` | `FocumiMaxLAWaiting` | `FocumiMaxLAReturning` | 三态静态图齐全，可继续使用 |

注意：当前 Live Activity 代码和 preview 文案仍有 Toto 映射；应在后续 App 修改轮恢复为 Max。Live Activity 本身不需要逐帧角色动画，可用静态三态 + 系统倒计时/状态转场。

### 3.2 Shield

根目录：

`DisciplinedPetShieldConfiguration/Resources/FocumiShieldVintage.xcassets`

| 角色 | Asset | 可用性 |
|---|---|---|
| Milo | `FocumiMiloShieldPortrait` | 可继续使用 |
| Max | `FocumiMaxShieldPortrait` | 可继续使用 |

Shield 应保持静态、清晰、低干扰；不应播放动画，也不能用角色表情或动效暗示保护已经成功。

## 4. 历史资产与复用边界

### 4.1 3D 连帽衫帧列

根目录：

`DisciplinedPet/Resources/Assets.xcassets`

Milo 和 Max 各已有：

- `Idle01...04`
- `Focus01...04`
- `Tap01...04`
- `Celebrate01...04`

另有旧版 Live Activity 128px 图与 `MiloReturnHero` / `MaxReturnHero`。

这些帧列的角色穿蓝/绿连帽衫，渲染方式偏 3D，与用户指定的手绘领巾 Milo/Max 不同，因此：

- **不可作为 v0.6 正式角色画面继续使用；**
- 可复用帧播放、节拍、冷却、Reduce Motion 与非循环播放的工程机制；
- 可作为动作幅度和技术尺寸参考，但不能作为绘制模型参考。

### 4.2 当前 Vintage 单张状态图

正式 Milo/Max 每个状态仅有一张图，当前 UI 通过静态图切换表达状态。它们可作为：

- character identity reference；
- 关键 pose / endpoint；
- Reduce Motion 最终静态状态；
- UI layout 与系统表面品牌化资产。

它们不能单独证明角色 animation 已完成。

## 5. Animation Gap Map

图帧数量仅用于估算，不作为完成 KPI。验收以动作因果、角色一致性、可读性和真机表现为准。

| Moment | 已有正式输入 | 缺失 | 建议角色表演 | 真动画要求 |
|---|---|---|---|---|
| Idle | Idle 静态图 | 呼吸、眨眼、耳/尾低频变化 | Milo：眼神先动、尾尖轻停；Max：耳朵轻响应、身体略前倾 | **需要**低频循环，但可最后补 |
| Pact | Pact 静态图 | 用户输入目标后的注意转移 | Milo 先看文字/书页，再轻压页边；Max 先竖耳，再看向目标并靠近 | **需要**短 one-shot；输入控件本身由 SwiftUI 完成 |
| Goal Notice | Pact pose | 明确的“听见/看见目标”瞬间 | Notice → attention shift → settle | **需要**眼神、耳朵、头部的真实连续动作 |
| Start Together | Start 静态图 | 从 Pact 到 Focus 的完整连接 | Milo 轻触/按住页面进入陪伴；Max 先靠近，再用宽前爪安顿页面 | **必须**制作真实角色动画 |
| Focus Ambient | Focus 静态图 | 长时低频生命感 | Milo 低重心阅读、偶尔眨眼/尾尖；Max 耳朵、呼吸、一次轻微重新伏下 | **需要**可循环角色动画；UI 计时不替代 |
| Tap Response | Tap 静态图 | 起势、反应峰值、回落 | Milo 先转眼再轻抬头；Max 先动耳再歪头/靠近，避免跳跃卖萌 | **需要**短 one-shot 与冷却 |
| Waiting | Waiting 静态图 | 从 Focus 离开后的状态转变及等待生命感 | Milo 压住书/书签并降低视线；Max 守在书边、耳朵保持等待 | **必须**至少有进入动作；等待循环可低频 |
| Return Together | Waiting + Return + Focus 静态图 | Notice、Recognition、Attention Shift、Re-engage、Settle 的连续因果 | 见 §6 | **最高优先级，必须真实逐帧** |
| Completion | Complete 静态图 | 察觉完成、取/按印章、接触、回弹、共同确认 | Milo 克制盖章后看用户；Max 主动靠近盖章，动作略快但不弹跳 | **必须**制作 2–4 秒 signature animation |
| Gentle End | Cancel 静态图 | 从当前状态柔和退出 | 收回前爪/放松身体/回到安静同行，不沮丧 | **需要**短 one-shot；非最高优先级 |

## 6. Return Together 动作建议

共同节奏保持：

`Waiting → Notice → Recognition Pause → Attention Shift → Re-engage → Settle Together`

### 6.1 Milo Return

基于猫的低重心与前爪控制设计：

1. Waiting：前爪靠近书页/书签，视线在页面；
2. Notice：眼睛先移向用户；
3. Recognition Pause：耳朵和头部随后轻转，保留短停顿；
4. Attention Shift：视线先回页面；
5. Re-engage：前爪重新压住或轻推页面边缘；
6. Settle：胸腹降低，回到 Focus 静态姿态。

必须新增的关键姿态：眼睛 notice、头部 recognition、视线回页、爪接触、页面受力、身体 settle。

### 6.2 Max Return

基于幼犬耳朵、宽前爪和主动靠近设计：

1. Waiting：趴/坐在书边，前爪靠近书或书签；
2. Notice：耳朵先竖/转，再把视线移向用户；
3. Recognition Pause：轻微身体前倾，不跳起；
4. Attention Shift：鼻尖和眼神回到页面；
5. Re-engage：用宽前爪压稳页面，或用鼻尖/前爪轻推书页回到可读位置；
6. Settle：胸部降低，回到 Focus 陪伴姿态。

必须新增的关键姿态：耳朵 notice、身体前倾、视线回页、犬爪接触、页面响应、胸肩 settle。

两只角色不能机械共用一套骨架动作。共同情绪一致，物种表达不同。

## 7. SwiftUI Motion 与真正角色动画的边界

### 7.1 可由 SwiftUI 完成

- 页面/章节的 push、slide、fade、mask reveal；
- 页面背景、书签、缝线、状态标签的克制转场；
- Timer 数字变化、进度、CTA press feedback；
- 角色舞台的接触阴影、背景色温、景深与轻微视差；
- Haptic 与 sound 的时序调度；
- Live Activity 的状态替换和系统倒计时；
- Reduce Motion 下直接落到正式静态 pose；
- 动画中断、生命周期 reconcile、防重复播放的 presentation orchestration。

### 7.2 必须制作真正角色动画

- 眼神注意与视线转移；
- 耳朵、头部、胸肩、前爪、尾巴的连贯身体表演；
- 爪/鼻与书页、书签、印章的真实接触；
- 纸张受力、弯曲、展开、落下和 settle；
- Notice → Recognition → Action 的情绪停顿；
- Completion 盖章的接触、重量与回弹；
- 从动作姿态回到稳定陪伴姿态的重量转移。

禁止用单纯 `scale / offset / rotation / fade / PNG swap` 冒充上述表演。

## 8. 建议保留与新增的动作清单

### 8.1 直接保留

- 正式 App 静态：Milo/Max 的 Idle、Pact、Start、Focus、Waiting、Return、Complete、Tap、Cancel；
- Live Activity：Milo/Max 的 Focus、Waiting、Returning；
- Shield：Milo/Max portrait；
- `PetFrameAnimation` 的播放时间模型、tap cooldown、非循环模式；
- `CompanionPerformanceState` 的“业务状态允许何种表现”分层思想；
- Reduce Motion 静态落点与不由动画反证系统成功的原则。

### 8.2 P0 动画新增顺序

1. **Return Together — Milo**
2. **Return Together — Max**
3. **Start Together — Milo / Max**
4. **Completion — Milo / Max**
5. Waiting 进入与等待循环
6. Focus Ambient 循环
7. Pact / Goal Notice
8. Tap Response
9. Idle
10. Gentle End

每个动作应先做关键姿态/animatic 验证，再生产正式帧；不要一开始批量补齐所有绘制。

## 9. UI Experience Rebuild 可并行部分

### 可立即与动画设计并行

- 恢复 `.dog → Max` 的表现层命名与资产路由；
- 清除正式 UI 对 Toto 资产的引用，但保留历史文件；
- 用已批准 Milo/Max 静态 pose 搭建 Onboarding、Pact、Focus、Waiting、Return、Completion；
- 重构连续页面舞台、Timer、单一 CTA、状态真实性文案；
- 完成 Dynamic Type、VoiceOver、Reduce Motion 的静态路径；
- 完成 Live Activity / Dynamic Island / Shield 的 Milo/Max 品牌映射；
- 建立动画插槽、可中断 coordinator、haptic/sound cue contract。

### 必须等待正式动画资产

- 宣称 Start / Return / Completion 已达到 Character Performance 验收；
- 最终节拍与声音同步；
- 动作接触阴影和纸张物理的精调；
- 真机帧率、内存、解码与动画中断验收。

## 10. 第一性原理与红队

### 前提

- 根目标不是换一个更漂亮的角色，而是让用户原本认可的 Milo / Max 真正产生陪伴感；
- 角色身份一致性是必要条件，动作丰富度不能以“变脸”为代价；
- 系统保护真值与角色表演必须保持单向依赖。

### 主要误用方式

1. 把旧 3D 连帽衫帧列因为“已经有四帧”而重新上线；
2. 把九张 Vintage 静态图快速 cross-fade，宣称逐帧动画完成；
3. 把 Toto 文件改名成 Max，伪装完成角色恢复；
4. 用 Return 动画播放完成作为 Shield 已重新生效的证据；
5. 同时批量生产两只宠物全部动作，尚未验证 Return 就大量消耗资产预算。

### 阻断证据

- 用户指定截图与 `FocumiMiloIdle` / `FocumiMaxIdle` 视觉匹配；
- 旧帧列的服装、渲染、比例与正式形象明显不同；
- 当前源码明确把旧帧名降为 compatibility，同时把 Dog 映射为 Toto；
- 正式 Vintage 资产每状态只有单张，不构成连续角色动画。

### 残余风险与闭环

- 静态状态图之间仍存在姿态、尺度和书本构造差异，正式逐帧生产前必须建立“基于现有身份的动画一致性参考”，但不能借此重新设计角色；
- Return 的页面物理需要分别为猫和狗验证，不能复用 Gate 0 橘猫动作结果冒充两只角色均通过；
- 建议先各做一套 Return key-pose/animatic，再决定正式帧生产规格。

## 11. 本轮状态

`AUDIT_COMPLETE — WAITING_USER_CONFIRMATION`

没有进入动画生产，也没有修改 App。
