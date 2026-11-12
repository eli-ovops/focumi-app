# Focumi v0.6 Experience Execution PRD

> 版本：v0.6 — Keep the Existing Pets. Make Them Alive.  
> 日期：2026-08-13  
> 状态：执行候选，等待用户确认  
> 产品阶段：v0.5 稳定功能底座上的 Experience Layer 重建  
> 输入依据：用户当轮方向校正、现有工程、Existing Pet Asset Audit + Animation Map  
> 本 PRD 不授权：TestFlight、App Store、公开发布、账号操作、批量动画生产或删除历史资产

---

## 0. 一屏执行定义

### 0.1 核心决策

> **Keep the existing pets. Make them alive.**

Focumi v0.6 不再重新设计宠物是谁，而是让用户已经认可的 Milo 与 Max 真正通过动作、场景、转场、触感和声音产生陪伴感。

正式角色唯一来源：

- **Milo**：橘色虎斑猫、鼠尾草绿色领巾；
- **Max**：黑白哈士奇幼犬、灰蓝格纹领巾。

核心体验链：

`Pact → Start Together → Focus Together → Waiting → Return Together → Completion`

最重要的 Signature Moment：

> 用户回来时，宠物真的注意到用户回来，并重新和用户进入专注状态。

### 0.2 版本目标

在不推翻 Session、Timer、Family Controls、ManagedSettings、Shield、temporary access、Return 和 Live Activity 业务真值的前提下，完成：

1. Milo / Max 正式身份恢复；
2. 统一、连续、可用的 Focumi UI Experience Layer；
3. Milo / Max 的 Start、Return、Completion 正式角色表演；
4. Focus、Waiting、Tap、Idle 等必要生命感；
5. Haptic、Sound、页面转场与 Reduce Motion 等价路径；
6. App、Live Activity、Dynamic Island、Shield 的一致品牌表达；
7. 真机完整闭环与 TestFlight 候选证据。

### 0.3 版本完成定义

v0.6 完成不以“生成了多少张图”判断，而必须同时满足：

- 用户第一眼仍认出原来的 Milo / Max；
- 主要页面属于同一个 Focumi 世界，不是卡片墙或海报合集；
- Return 的注意、识别、重新投入与安顿动作静音可读；
- Start / Return / Completion 不是静态 PNG 切换；
- 功能、状态真实性、辅助功能和真机系统表面均通过；
- 构建、模拟器截图或开发者自述不得代替真机 Shield / Live Activity 证据。

---

## 1. Problem Statement

Focumi 已拥有真实工作的专注、App Blocking、临时开放、Return 和 Live Activity 底座，但体验层仍存在三个根本问题：

1. 宠物主要依赖静态状态图切换，用户看不到“它注意到我、回应我、陪我重新开始”的连续表演；
2. 此前新角色探索把产品带离用户认可的 Milo / Max 身份，并让 Toto/Pomeranian 临时进入当前表现层；
3. 页面虽然加入纸本配色和装饰，但仍有卡片堆叠、角色海报嵌入、页面彼此割裂等问题，尚未形成连续的互动体验。

用户需要的不是另一轮角色设计，而是：

> 原来的两只宠物还在，但它们现在真的会注意、会等待、会回应、会陪用户完成一件事。

---

## 2. First-principles Review

### 2.1 必要前提

1. Focumi 的实用骨架是可信的 App Blocking 与 Timer；角色表演不能损坏或虚构系统事实；
2. 用户购买欲来自 Utility × Character × Delight，三者缺一不可；
3. 角色身份一致性先于动画数量；变脸的“高帧数”比静态图更糟；
4. 陪伴感来自 Notice → Attention Shift → Action → Contact → Settle，而不是 scale、fade 或弹跳；
5. 真实接触、身体重量和情绪停顿是 Signature Moment 可读性的必要条件；
6. UI 必须服务目标、Timer、真实状态与主要 CTA，装饰不能降低可用性；
7. 动画完成只能说明表演播放完成，不能证明 Shield、Return 或 Live Activity 系统操作成功。

### 2.2 红队攻击与阻断

| 误用方式 | 错误结果 | 阻断证据 / Gate |
|---|---|---|
| 把 Toto 文件改名为 Max | 名字恢复、角色未恢复 | 必须与用户指定 Milo/Max 视觉身份逐项核对 |
| 把九张静态状态图 cross-fade | 冒充逐帧动画 | Signature Moment 必须通过静音动作因果验收 |
| 复用旧蓝/绿连帽衫 3D 帧列 | 角色变脸 | 旧帧仅复用播放代码，不进入正式 UI |
| 用 SwiftUI scale/offset 制造生命感 | 身体没有真实表演 | 眼神、耳、头、爪、胸肩、尾巴与接触必须存在连续角色帧 |
| Return 动画结束后显示“已保护” | 表演伪造系统事实 | 系统状态只由业务真值层决定；动画不得写回成功 |
| 一次批量生产全部动作 | Return 未成立就扩大成本 | Return-first；每只角色先过 animatic，再批准正式帧 |
| UI 为配合风格重画角色 | 再次偏离身份 | 融合通过背景、阴影、色彩、排版、动效实现 |
| 声音抢占用户音乐 | 精致感变成干扰 | 只用短 cue、支持静音、与其他音频混合；后台音乐另设门禁 |
| 只在模拟器验收 | 系统表面和性能被误判 | Checkpoint C 必须指定真机闭环 |

### 2.3 残余风险

- 现有各状态静态图之间仍有尺度、书本结构与姿态差异；正式动画前需做一致性修正，但不能借机重新设计角色；
- Milo 与 Max 需要分别验证动作，不能用一套骨架换皮；
- 栅格逐帧可能增加包体、解码和内存压力，必须先用 Return spike 冻结技术预算；
- Live Activity 与 Shield 能承载的动态程度有限，必须优先保持清晰和系统稳定。

---

## 3. Goals and Non-goals

### 3.1 Goals

1. 恢复 Milo / Max 为所有正式用户表面的角色；
2. 让两只宠物通过各自物种特征表达相同情绪链；
3. 把 Return Together 做成 Focumi 第一记忆点；
4. 把 Start Together 和 Completion 做成可独立录屏的 Signature Moments；
5. 让 Focus 与 Waiting 在长时间停留时仍有克制生命感；
6. 让 App 各页面和系统表面属于同一体验世界；
7. 保持业务状态、Blocking 真实性、数据和系统能力不退化；
8. 达到中英文、Dynamic Type、VoiceOver、Reduce Motion 的主路径等价体验。

### 3.2 Non-goals

- 新角色 Concept、Model Sheet 或物种探索；
- Toto/Pomeranian 或第三只宠物；
- 金币、XP、商城、家具、签到、等级、连续天数、排行榜；
- AI 对话、社交、服务器、账号或云同步；
- 重写 Session、Timer、Family Controls、Shield 或 Return 状态机；
- 用复杂收集系统增加“产品感”；
- TestFlight 上传、App Store 发布或真实用户招募。

---

## 4. User Stories

1. 作为第一次打开 App 的用户，我希望看到 Milo 和 Max 原本熟悉的形象，以便相信产品没有换掉我喜欢的伙伴。
2. 作为认领 Milo 的用户，我希望每个页面、Live Activity 和 Shield 都保持他的虎斑、脸型和绿色领巾。
3. 作为认领 Max 的用户，我希望每个页面、Live Activity 和 Shield 都保持他的黑白面罩、幼犬比例和灰蓝格纹领巾。
4. 作为准备专注的用户，我希望宠物注意到我写下的目标，以便目标像我们共同要做的事。
5. 作为点击开始的用户，我希望宠物从 Pact 自然进入陪伴姿态，而不是页面突然跳成倒计时。
6. 作为专注中的用户，我希望宠物有低频、安静的生命感，但不会变成新的干扰。
7. 作为点击宠物的用户，我希望得到一次短而自然的回应，并且不会形成无限点击循环。
8. 作为暂时离开的用户，我希望宠物进入等待状态并替我保留当前目标，而不是生气或责备我。
9. 作为回到 App 的用户，我希望宠物先注意到我回来，再重新看向目标并安顿下来。
10. 作为 Milo 用户，我希望 Return 动作像猫：眼神先动、低重心、前爪与页面产生可信接触。
11. 作为 Max 用户，我希望 Return 动作像幼犬：耳朵和身体先响应、宽前爪或鼻尖自然重新投入目标。
12. 作为完成专注的用户，我希望宠物用自然、可读的共同完成动作回应我；Focumi Completion Stamp 是首选表达，但不能以牺牲角色动作自然度为代价。
13. 作为提前结束的用户，我希望宠物柔和收势，目标仍可再次开始，而不是表现失望。
14. 作为开启 Reduce Motion 的用户，我希望直接看到完整、清晰的最终姿态，核心意义和 CTA 不减少。
15. 作为 VoiceOver 用户，我希望先听到目标、剩余时间和真实保护状态，角色装饰不抢走操作焦点。
16. 作为使用大字号的用户，我希望 Timer、目标和 CTA 不被角色或装饰遮挡。
17. 作为正在听音乐的用户，我希望 Focumi 的短声音不抢占或停止我的音频。
18. 作为静音用户，我希望关闭声音后仍通过画面和触感理解关键反馈。
19. 作为使用锁屏或灵动岛的用户，我希望看到与 App 一致的 Milo / Max 与真实会话状态。
20. 作为误点受限 App 的用户，我希望 Shield 清楚表达返回或申请使用，而不会用可爱角色模糊系统事实。
21. 作为系统保护仍在请求中的用户，我希望界面只说正在请求，而不是因动画完成就宣称已恢复。
22. 作为 Beta 测试用户，我希望所有主路径都可完成，不会因动画卡住按钮或状态推进。
23. 作为产品 Owner，我希望角色动画和业务状态分离，以便视觉升级不破坏可靠功能。
24. 作为产品 Owner，我希望每个 Signature Moment 能独立录屏和比较，以便判断产品感是否真正提升。
25. 作为工程 Owner，我希望所有角色帧使用统一画布和锚点，以便播放时不跳动、缩放或裁切。
26. 作为工程 Owner，我希望生命周期恢复不会重复播放动画、重复触感或重复结算。
27. 作为工程 Owner，我希望没有正式动画资产时明确使用静态落点，而不是包装低质量占位图为完成品。

---

## 5. Product Experience Specification

### 5.1 全局页面结构

每个功能页面优先顺序：

1. 小型章节/状态标识；
2. 页面标题或当前目标；
3. Timer / 核心系统状态；
4. Milo 或 Max 的当前行为舞台；
5. 一个主要 CTA；
6. 必要的诚实 Blocking 说明。

视觉比例：

`70% functional clarity / 30% editorial decoration`

允许：温暖纸本、柔和手绘背景、克制编辑感、书签/缝线/页码、小范围收藏感。

禁止：卡片墙、深蓝科技背景、玻璃拟态、科技圆环、海报嵌套、花边和贴纸堆叠。

### 5.2 页面范围

#### Onboarding

- 明确讲清：focus companion + app blocking；
- 并排展示正式 Milo / Max，尺寸、背景和完成度一致；
- 不展示 Toto；
- 宠物名允许使用默认名或现有命名流程，但物种身份不可改变；
- 权限说明和角色选择分层，不堆成大卡片墙。

#### Home / Focus Pact

- 目标输入、时长和 App 选择保持最高可用性；
- Pact 角色姿态对目标产生注意，而不是纯装饰；
- 一个主 CTA；未准备好时明确缺少什么；
- 角色与输入区处于同一连续页面，而不是角色海报 + 表单卡片。

#### Start Together

- 触发：用户确认合法开始；
- 表演：Notice → Approach/Contact → Settle into Focus；
- UI：目标保持可见，Timer 自然进入；
- 动画可中断，不阻塞核心状态推进；
- 轻触感与可选短声音仅表示“开始时刻”，不表示 Shield 已生效。

#### Focus Together

- 始终显示目标、剩余时间、真实保护措辞；
- 宠物使用 Focus pose + 低频 ambient；
- 不持续播放高频动作，不诱导反复点击；
- 结束入口清楚但不抢主舞台。

#### Waiting / Detour

- 宠物明确从 Focus 转为守候；
- 目标与返回入口始终可见；
- 必要使用原因和暂时开放规则功能清楚；
- Waiting 不表达失望、焦虑或内疚。

#### Return Together

共同节奏：

`Waiting → Notice → Recognition Pause → Attention Shift → Re-engage → Settle Together`

- Recognition Pause 建议约 200–350ms，最终以 animatic 可读性为准；
- 动画开始不代表保护恢复；
- 在系统尚未确认的阶段只显示 requesting/returning 等中性事实；
- 完成后落到 Focus pose，但业务状态仍由 reducer/client 决定。

Milo：眼睛先于头与身体；低重心；猫爪压/推页面或书签关系清楚。

Max：耳朵/胸肩先响应；轻微主动前倾；宽犬爪或鼻尖参与重新投入；不跳跃卖萌。

#### Completion

- 只有合法完成才触发；
- 2–4 秒 signature celebration；
- **Focumi Completion Stamp 为 preferred，而不是 MUST；**
- 首先尝试以原创 Completion Stamp 表达共同完成；宠物动作可包含注意完成、接触印章、下压、回弹和共同确认；
- 如果盖章使 Milo / Max 出现拟人化用爪、重心不可信、接触因果不清或整体 acting 生硬，可在用户确认后换成更符合物种结构的原创共同完成动作；
- 替代动作仍必须清楚表达“我们一起完成了这件事”，而不是金币、XP、烟花、宝箱或通用庆祝贴图；
- 无金币、XP、烟花、宝箱；
- 提前结束、超时和撤权不得播放完成动作。

#### Settings

- 保持可读、可扫描，减少装饰；
- 显示当前正式 Milo / Max；
- 声音、触感、Reduce Motion 服从系统与产品设置；
- 不保留 Toto 用户可见名称。

#### Live Activity / Dynamic Island / Shield

- 使用现有正式 Milo / Max 专用资产；
- Live Activity 只需 Focus / Waiting / Returning 三态静态视觉与真实倒计时；
- Dynamic Island 优先可读性，不塞入复杂动画；
- Shield 使用静态 portrait，不播放角色动画；
- 未确认保护时不得使用“已保护”“已恢复”等措辞或成功动效。

### 5.3 Motion / Haptic / Sound

#### UI Motion

- 页面、书签、标签、Timer、CTA、背景与阴影由 SwiftUI motion 完成；
- 转场不超过核心信息出现所需时间；
- CTA 在动画期间始终可操作；
- Reduce Motion 直接落在完整静态目标状态。

#### Haptic

- Start：一次轻 impact；
- Return Recognition 或 Settle：一次轻、克制 impact，不能表示系统保护成功；
- Completion：一次 success，仅在合法完成；
- Tap：selection，保留冷却；
- 拒绝/撤权不使用惩罚式 error haptic。

#### Sound

- v0.6 只要求短 cue，不要求持续背景音乐；
- Start、Return、Completion 各自拥有克制、原创、可关闭的声音标识；
- 默认与用户正在播放的音频混合，不抢占；
- 静音时体验意义保持完整；
- 声音文件不携带语音、版权音乐或外部品牌素材；
- 若后台音乐无法通过中断、锁屏、耳机和来电门禁，正式构建隐藏该入口。

---

## 6. Character Animation Production Specification

### 6.1 技术路线

首选：**原生透明栅格逐帧序列 + 现有 SwiftUI 表现层播放状态机**。

理由：

- 最能保留手绘线条、纸张颗粒与角色原貌；
- 工程已有帧名、节拍、循环、tap cooldown 和 Reduce Motion 基础；
- 无需引入第三方运行时；
- 可直接对每帧检查身份、爪纸接触和结构一致性。

第一轮不引入 Lottie / Rive：两者分别偏矢量/AE 与交互矢量状态机，需要重新转译现有栅格绘本角色，并增加运行时依赖和维护面。

升级条件：若 Return 真机 spike 出现不可接受的解码、内存或掉帧，再限域评估原生 Texture Atlas / SpriteKit；不先做全局渲染架构重写。

### 6.2 资产合同

每个 clip 必须具备：

- 固定画布尺寸；
- 固定角色锚点、书脊与场景参考点；
- 透明背景；
- 统一色彩空间、缩放和导出设置；
- 明确帧顺序与每帧时长；
- loop / one-shot / interruptible 标记；
- Reduce Motion 静态 landing frame；
- 角色、道具和接触关系 QA；
- 版本化目录，不覆盖 approved master。

绘制数量只是人力和包体预算，不是完成 KPI。动作成立时可以少帧；动作不成立时不能用补间数量掩盖。

### 6.3 动画生产顺序

#### Phase B0 — Return Performance Validation

1. Milo Return key poses / animatic；
2. Max Return key poses / animatic；
3. 各自通过身份、物种动作、静音可读性、接触因果；
4. 冻结首个正式 clip 的画布、锚点、导出和播放预算。

#### Phase B1 — Signature Production

1. Milo Return；
2. Max Return；
3. Milo / Max Start；
4. Milo / Max Completion。

#### Phase B2 — Supporting Performance

1. Waiting enter / ambient；
2. Focus ambient；
3. Pact / Goal Notice；
4. Tap Response；
5. Idle；
6. Gentle End。

### 6.4 动作验收原则

- 静音、不看文案仍能读出动作意图；
- 眼神领先头部，头部领先身体；
- 爪/鼻与纸、书签、印章存在清楚接触；
- 道具的运动由角色动作引起；
- 纸张有受力、弯曲、展开和 settle；
- 身体尺度与锚点稳定；
- 不出现人手、人腕、拟人站立或无意义卖萌动作；
- Milo 与 Max 的 pose language 明显不同；
- 最后一帧可以无跳变接入稳定静态 pose。

---

## 7. Implementation Decisions

### 7.1 业务真值边界

以下模块保持稳定，不做无理由重写：

- Session / deadline；
- Family Controls authorization 与 selection；
- ManagedSettings Shield apply / clear；
- temporary access / detour；
- Return reducer 与幂等重锁请求；
- Live Activity session projection；
- 本地数据与历史兼容。

### 7.2 表现层边界

继续使用独立 `CompanionPerformanceState` 或等价高层 seam：

`Business state → permits performance intent → renderer plays presentation`

禁止反向链路：

`animation completion → business success`

表现层需要支持：

- one-shot token；
- interruption；
- lifecycle reconciliation；
- replay suppression；
- Reduce Motion landing；
- haptic/sound cue；
- 不阻塞 CTA；
- 合法完成与非完成严格分离。

### 7.3 身份恢复

- 持久化 `.cat / .dog` 稳定 ID 不变；
- 用户可见 Dog 恢复为 Max / Husky；
- 所有正式资源路由恢复 `FocumiMax*`；
- Toto 文件保留历史，不进入 build/runtime 正式路由；
- 新角色探索统一登记为 `DEPRECATED_CHARACTER_REDESIGN_EXPLORATION`，不改写历史文件。

### 7.4 UI 与动画并行

UI 工作可先使用正式 Milo/Max 静态 pose 完成 Checkpoint A；动画组件以接口插槽接入，不等待所有帧生产。

允许并行：

- 身份/资产路由恢复；
- 连续页面结构；
- Timer、CTA、真实状态；
- Live Activity / Shield 静态品牌映射；
- Dynamic Type、VoiceOver、Reduce Motion 静态路径；
- animation coordinator / cue contract；
- Return animatic 设计。

禁止并行冲突：

- UI Owner 不覆盖 approved pet masters；
- Animation Owner 不改业务 reducer；
- 两个 Owner 不同时改同一资源映射或 project file；
- 没有通过 animatic 的动作不得批量生产。

---

## 8. Execution Plan and Checkpoints

只保留三个用户 Checkpoint，不增加流程审批层。

### Checkpoint A — Complete UI World

#### 执行范围

1. 恢复 Milo / Max 名称、描述和资源路由；
2. 移除正式 runtime 对 Toto 的引用，但不删除历史资产；
3. 使用正式静态 pose 重构所有主要页面；
4. 将卡片墙改为连续 page canvas、分隔、书签与留白；
5. 完成 Live Activity / Dynamic Island / Shield 的 Milo/Max 品牌映射；
6. 保证中英文、Dynamic Type、VoiceOver、Reduce Motion 的基础主路径不坏；Checkpoint A 不要求完整 Increase Contrast 或 accessibility evidence matrix；
7. Build 与测试通过。

#### 用户判断

> 整个 App 现在是不是终于像 Focumi，而且仍然是原来的 Milo 和 Max？

#### Acceptance

- Onboarding、Pact、Start、Focus、Waiting、Return、Completion、Settings 统一；
- 每页一个主要 CTA，目标/Timer/真实状态清楚；
- 不再出现 Toto、Pomeranian 或旧 3D 连帽衫角色；
- 无大面积角色矩形海报嵌套；
- 角色与场景通过背景、阴影和构图融合；
- 系统表面提供品牌预览；
- 静态路径在中英文和基础辅助功能主路径可用，不出现关键内容裁切、CTA 不可达或角色抢占核心操作；
- 完整 Increase Contrast 与 accessibility evidence matrix 明确留到 Checkpoint C。

Checkpoint A PASS 不代表角色动画完成。

### Checkpoint B — Character Performance

#### 执行范围

1. Return-first animatic；
2. Milo / Max Return 正式逐帧；
3. Start / Completion 正式逐帧；
4. Waiting / Focus / Tap / Idle / Gentle End 必要动作；
5. Haptic / Sound / UI motion 时序接入；
6. 中断、防重复、Reduce Motion 与静态 landing。

#### 用户判断

> Milo / Max 是不是像真的在陪我，而不是图片在切换？

#### Acceptance

- 三个 Signature Moments 静音可读、可独立录屏；
- Return 对 Milo/Max 具有不同物种动作；
- 动画期间 CTA 可操作；
- 生命周期不会重复播放或重复结算；
- Reduce Motion 保持完整意义；
- 声音可关闭且不抢占用户音频；
- 角色没有变脸、跳锚、裁切、肢体或接触错误。

### Checkpoint C — Device Beta

#### 执行范围

- 真机完整流程；
- Shield 施加、开放、Return、重新保护；
- Live Activity / 锁屏 / Dynamic Island；
- 冷启动、热启动、被终止与 lifecycle；
- Reduce Motion、VoiceOver、Dynamic Type、Increase Contrast；
- 完整 accessibility evidence matrix，包括中英文、最大辅助字号、VoiceOver 顺序、Reduce Motion、Increase Contrast 及关键页面/系统表面的证据；
- 动画帧率、内存、包体和声音中断；
- Milo 与 Max 各一次完整闭环；
- Debug/Release build 与自动化回归。

#### Acceptance

- 系统状态与 UI 文案一致；
- 动画不阻塞、误导或重复；
- Live Activity 结束及时清理；
- Shield、Return 与重锁以真机观察取证；
- 60fps 为目标；若存在可感知持续掉帧、解码闪烁或内存压力，Checkpoint C FAIL；
- 完成真实证据矩阵后才能成为 TestFlight candidate。

Checkpoint C PASS 仍不自动授权 TestFlight 上传。

---

## 9. Testing Decisions

### 9.1 测试原则

- 测试外部行为和语义，不锁死 SwiftUI 实现细节；
- 自动化验证状态许可、token、幂等和真实性；
- 视觉/动作通过 contact sheet、animatic、截图和真机录屏验证；
- Simulator 不证明 Family Controls、Shield 或 Live Activity 真机能力；
- 动画完成不进入业务成功断言。

### 9.2 自动化测试

必须覆盖：

- `.dog` 正式显示为 Max，不显示 Toto；
- Milo / Max 对每个 performance state 的正式资源映射；
- Start / Return / Completion intent 每次只产生一次；
- reconcile、重复 tap、scene active 不重复触发；
- 非合法完成不产生 completion intent / haptic / sound；
- Return 重锁请求保持原有幂等次数；
- 未确认状态不出现“已保护/已恢复”；
- Reduce Motion 使用正确静态 landing；
- Live Activity 投影为 Focus / Waiting / Returning；
- 旧 snapshot 的 `.dog` 数据无需 migration 仍可恢复为 Max。

### 9.3 视觉与动作 QA

每个正式 clip 检查：

- 首帧、末帧与相邻 UI pose 连续；
- 角色身份、花纹、配饰、比例一致；
- 画布、锚点和书脊稳定；
- 接触点和物理因果清楚；
- 浅色/深色背景可分离；
- 1x/2x/3x 与主要设备尺寸不裁切；
- 中英文、大字号不遮挡角色和 CTA；
- Reduce Motion、VoiceOver 与动画语义等价。

### 9.4 真机矩阵

Milo / Max 各覆盖：

`Pact → Start → Focus → Shield → Detour → Waiting → Return → Re-protection → Completion / Gentle End`

额外覆盖：

- 通知开/关；
- 声音开/关、正在播放音乐、耳机、来电/系统中断；
- 前后台切换与强制终止；
- Dynamic Island compact / expanded；
- 锁屏；
- Reduce Motion；
- VoiceOver；
- 最大辅助字号；
- Increase Contrast。

---

## 10. Acceptance Gates

### 10.1 Character Identity Gate

- 用户确认 Milo / Max 第一眼仍是原角色；
- 不出现 Toto 或旧 3D 连帽衫造型；
- 每帧的毛色、花纹、脸型、比例、配饰保持一致。

### 10.2 Performance Gate

- 只看静音动画即可说明角色注意、行动、接触和安顿；
- Return 是完整 attention shift，不是 waiting → focus 图切换；
- Completion 若使用 stamp，必须有重量和接触，不能只是贴纸出现；若 stamp 使 acting 不自然，可采用已经用户确认的替代表演，但仍须静音可读地表达共同完成；
- Milo / Max 不换皮复用表演。

### 10.3 Truth Gate

- Shield 未确认时不显示成功；
- haptic、sound、颜色和角色情绪不被用作保护成功证据；
- 提前结束、超时、撤权不播放 Completion；
- Live Activity phase 与业务 projection 一致。

### 10.4 Accessibility Gate

- Checkpoint A 只阻断基础主路径退化：关键内容不可裁切，核心 CTA 必须可达，角色不能抢占操作焦点，Reduce Motion 必须有可理解的静态落点；
- 以下完整证据要求在 Checkpoint C 验收：
- Reduce Motion 直接落到等价静态状态；
- VoiceOver 顺序为目标 → Timer → 真实状态 → 主 CTA；
- 角色不自动抢首焦点；
- Dynamic Type 不裁切关键内容；
- Increase Contrast 下状态、文字、CTA 与装饰仍可区分；
- 声音和触感不是理解状态的唯一方式。

### 10.5 Performance and Packaging Gate

- 首个 Return spike 后冻结帧画布、解码、包体与内存预算；
- 正式资产按 App / Live Activity / Shield target 分离，不把大图复制进所有 target；
- 无持续可感知掉帧、闪烁、跳锚或后台无意义播放；
- 动画资源可版本化回退，approved master 不覆盖。

---

## 11. Stop Conditions

任一情况发生，停止扩大动画生产并回到当前环节修正：

- 用户不能第一眼认出原 Milo / Max；
- Return animatic 静音不可读；
- 角色接触、纸张物理或身体结构不可信；
- 同一 clip 内出现明显变脸、花纹漂移、比例漂移；
- 必须改写业务真值层才能播放动画；
- 动画导致 CTA 阻塞、系统状态误导或重复结算；
- Return spike 在目标真机上存在无法接受的性能/包体问题；
- UI 为迁就动画重新变成海报合集或卡片墙；
- 执行需要删除历史资产、覆盖 approved master 或新增未授权第三方运行时。

---

## 12. Deliverables

### Checkpoint A

- UI implementation map；
- Milo/Max 身份与资源路由修复；
- 完整主页面 UI；
- Live Activity / Shield 品牌预览；
- 中英文基础主路径截图，以及 Dynamic Type、VoiceOver、Reduce Motion 不退化的最小证据；
- Build / test evidence；
- 已知问题与产物清单。

### Checkpoint B

- Milo / Max Return contact sheet / animatic；
- Signature animation manifests 与正式帧；
- Start / Return / Completion 录屏；
- Supporting performance assets；
- Haptic / Sound cue spec；
- Reduce Motion landing matrix；
- 自动化测试与视觉 QA。

### Checkpoint C

- 真机测试矩阵；
- Shield / Return / re-protection 录屏证据；
- Live Activity / Dynamic Island / 锁屏证据；
- VoiceOver / Dynamic Type / Reduce Motion 证据；
- 完整 Increase Contrast / accessibility evidence matrix；
- 性能、包体和声音中断报告；
- TestFlight candidate build 结论，但不上传。

---

## 13. Out of Scope

- App Store、TestFlight 或公开链接操作；
- Reddit、TikTok、外联或用户招募；
- 真实支付和商业绿灯；
- 新宠物、新物种、新角色视觉路线；
- 重写稳定业务架构；
- 后端、账号、分析 SDK、广告、订阅；
- 背景音乐内容系统；
- 房间、家具、货币、收藏、签到和连续天数；
- 删除、移动或覆盖历史探索资产。

---

## 14. Further Notes

### 14.1 权威资产审计

执行前使用：

`Docs/Audits/Focumi_v0.6_Existing_Pet_Asset_Audit_2026-08-13/Existing_Pet_Asset_Audit_and_Animation_Map.md`

其中正式资产为 `FocumiMilo* / FocumiMax*`；Toto 与后续角色重设计为历史探索。

### 14.2 复用技术核验

- Apple 原生 SwiftUI `TimelineView` 可按调度更新帧；
- SpriteKit 支持 texture sequence 与 texture atlas，可作为真机性能不足时的限域升级；
- Lottie iOS 为 Apache-2.0、支持 SwiftUI/Reduce Motion，但偏 AE/vector 工作流；
- Rive iOS 为 MIT、支持 SwiftUI 与状态机，但引入额外 runtime 和矢量重建成本。

当前选择：**自研最小原生栅格帧播放层，复用现有状态机；不依赖第三方。**

### 14.3 当前下一步

本 PRD 获用户确认后，首先执行：

> **Checkpoint A 收口：恢复 Milo/Max 正式路由并完成静态 UI World。**

与此同时只允许进行 Milo / Max Return 的关键姿态与 animatic 设计，不允许在 Return 表演通过前批量生产全部动画。
