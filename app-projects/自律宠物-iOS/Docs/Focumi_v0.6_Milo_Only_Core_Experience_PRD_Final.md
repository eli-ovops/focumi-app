# Focumi v0.6 Milo-only 核心体验 PRD

> 文档状态：`READY_FOR_IMPLEMENTATION_REVIEW`
>
> 日期：2026-08-20
>
> 产品阶段：冻结基线上的 UI 与 Milo 核心体验收口
>
> 本文用途：实现前最终产品合同；进入实现前仍须完成代码现状审计、精确文件 allowlist 与分层验收计划
>
> 本文当前不授权：代码修改、构建、真机、TestFlight、上传、发布、账号操作、付费或删除

## 1. Overview

Focumi 是一款以宠物陪伴为情绪入口、以专注计时和 iOS 干扰 App 限制为实用核心的 iPhone App。v0.6 是 Milo-only 核心体验收口版本：不重写现有 Session、Timer、Family Controls、Shield、Return、Live Activity 或持久化架构，只根据已确认 UI 参考重构用户可见界面、统一 Light Mode、调整 Milo 展示并收口页面间体验。当前正式用户表面只展示官方 Milo；Max 暂时隐藏，但其资产、历史 `.dog` 数据及兼容代码完整保留。v0.6 不生产新的 Milo 动画资产，只使用现有 Approved 静态姿态，通过页面转场、状态切换、Haptic 和声音验证基础陪伴感。核心闭环为“Meet Milo → 设置任务 → 专注 → 必要使用/返回 → 完成”；记录仅为已有真实数据支持时的可选辅助入口，不属于核心闭环。

## 2. Problem

### 2.1 用户问题

目标用户在学习或工作时容易打开社交或娱乐 App，普通倒计时工具缺少情绪连接，难以形成“愿意再次回来”的日常使用感。

### 2.2 当前产品问题

1. 现有功能底座已覆盖专注、必要使用、返回和完成，但页面视觉不统一，角色与功能层级没有稳定闭环。
2. 外部 AI 生成图曾改变 Milo/Max 身份；视觉参考与官方角色资产没有严格分离。
3. 同时呈现多个角色扩大了资产、状态和验收范围；当前版本需先验证 Milo-only 基础陪伴体验。
4. 单角色版本仍使用“伙伴选择”语义，会让用户产生“为什么只有一个选项”的困惑。
5. App 正常无活动状态进入时缺少短暂、可识别但不拖慢用户的品牌进入时刻；同时启动过渡不能遮挡 Session 恢复、Recovery、Permission 或错误状态。

### 2.3 证据边界

- 已知：当前仓库存在本地 SwiftUI 核心流程、专注 reducer、系统能力适配代码及 Milo Approved 静态资产。
- 已知：用户已确认 Milo-only、Max 展示层隐藏、无新 Milo 动画资产，以及当前 UI 参考方向。
- 未知：陌生用户是否愿意安装、完成首次专注、自然复用或付费。
- 本 PRD 不把概念图、构建、模拟器或旧 TestFlight 状态视为需求成立或商业绿灯。

## 3. Product promise

> 和 Milo 一起，安静地完成眼前这一件事。

核心结果：用户能快速确认 Milo、设定一个目标和时长，在 Milo 的陪伴下进入专注；离开后能无责备地返回；完成后获得清晰、克制的共同完成反馈。

### 3.1 v0.6 产品承诺边界

v0.6 验证的是：

> “Milo 的基础陪伴体验是否具有吸引力，并能与真实专注流程形成一致体验。”

v0.6 不承诺：

> “Milo 已具备完整生命动画系统。”

当前以 Approved 静态姿态、页面转场、状态切换、Haptic 和可关闭的短声音表达基础陪伴感。逐帧动画属于未来体验增强版本，必须另立资产与验收门禁，不作为 v0.6 的实现范围、发布条件或发布阻断。

## 4. Target users and situations

### 4.1 首批目标用户

- 容易在学习、阅读、写作或办公时被手机干扰的人。
- 喜欢温暖手绘宠物，但不希望 App 变成复杂养成游戏的人。
- 需要一次 15–120 分钟专注，而非医疗或成瘾治疗的人。

### 4.2 主要触发场景

- 准备完成一章阅读、一组习题、一段写作或一项桌面工作。
- 专注期间误入或主动打开干扰 App，之后返回当前目标。
- 完成一次专注后获得完成反馈，并决定是否再次开始。
- 已有真实记录入口时查看近期完成；没有足够数据时不强制展示记录功能。

## 5. Goals and non-goals

### 5.1 Goals

1. 核心页面形成同一套清晰、温暖、宠物优先的 Light Mode 视觉系统。
2. 当前所有正式用户表面只出现官方 Milo，不出现 Max 或其他宠物。
3. 将首次单角色入口定义为“Meet Milo / Milo 伙伴确认”，而不是虚假的多选页面。
4. 保留未来伙伴扩展所需的现有数据与路由能力，不改变 `.cat` / `.dog` 兼容数据格式。
5. UI 改造不改变既有核心业务 reducer、系统能力语义和真实状态边界。
6. 正常无活动状态进入时提供短、可提前结束、不阻塞操作的 Milo 品牌过渡；异常或恢复路径直接进入目标状态。
7. 正式体验仅使用已有 Approved Milo 静态姿态，不生产新角色动画资产。
8. 主路径支持 Dynamic Type、VoiceOver、Reduce Motion 和至少 44pt 触控区。
9. 建立可测试的首次确认 Milo、开始、返回和完成路径，为后续 Beta 的 C/R 验证保留真实事件入口。

### 5.2 Non-goals

- Max 的正式页面展示、动画、状态补全或上线入口。
- 新宠物、Pet Library、AI 宠物、自定义宠物或宠物生成能力。
- 新 Milo 动画生产流程、逐帧帧列、spritesheet、AI 补帧、骨骼绑定或新绘姿态。
- 商城、抽卡、金币、XP、家具、签到、复杂养成或商业化方案。
- 登录、用户系统、后端、云同步、社交或排行榜。
- 重新设计、重画或 AI 仿画 Milo。
- 新状态机、新 reducer，或重写 Session、Timer、Family Controls、Shield、Return、Live Activity、App Group 协议及持久化架构。
- Dark Mode；本轮只完成 Light Mode。
- TestFlight、App Store、公开招募或商业发布。

## 6. Product principles

1. **Milo first**：第一视觉焦点是官方 Milo；角色不能被当作卡片小图标。
2. **Clarity before decoration**：目标、计时器、真实状态和主操作优先于装饰。
3. **One screen, one primary action**：每页最多一个主 CTA；结束操作单独使用柔和橙色。
4. **No false system claims**：页面转场或 Haptic 完成不代表 Shield 已生效、已解除或已恢复。
5. **No forced waiting**：品牌过渡不能人为拖慢已经可用的 App。
6. **Official assets only**：运行时直接使用现有 Approved Milo 资产，不使用概念图中的生成角色。
7. **Reference-led implementation**：Codex 根据已确认 UI 参考实现，不自行创造新的产品方向或视觉系统。

### 6.1 v0.6 角色动效资产门禁

- v0.6 不生产新的 Milo 动画资产、逐帧帧列、spritesheet 或补间角色姿态。
- 正式体验仅使用现有 Approved Milo 静态姿态。
- 允许的增强方式仅包括：页面转场、现有静态姿态之间的状态切换、静态图整体 opacity/offset、简单 UI transition、Haptic 和可关闭的短声音。
- 不允许为了制造“生命感”对 Milo 静态图进行身体局部变形、骨骼绑定、AI 补帧或重新绘制。
- 角色逐帧动画属于后续体验增强，不是 v0.6 的实现范围、发布条件或发布阻断项。

### 6.2 v0.6 UI 实现范围

v0.6 包含：

- 用户可见 UI 重构；
- 页面布局调整；
- Milo 展示尺寸、位置和状态姿态调整；
- Light Mode 颜色、排版、按钮和留白统一；
- 短启动品牌过渡；
- Meet Milo、任务设置、专注、必要使用/返回、完成之间的体验收口；
- 已有真实数据支持时的轻量记录入口或空状态。

已确认 UI 参考稿是设计输入，不是可直接投产的角色资产，也不能覆盖业务真值。Codex 的职责是忠实实现已确认方向并复用现有组件、token、状态与 Approved 资产；不得自行发明新的视觉体系、产品功能、状态机或数据模型。

## 7. Scope: core surfaces

### 7.1 Launch moment（新增）

目的：在正常进入路径建立品牌识别，同时保证恢复与异常状态优先。

- 系统 Launch Screen 必须立即可用，且保持静态、轻量。
- App 必须先解析现有持久化状态、Session、Recovery、Permission 与错误状态，再决定是否显示品牌过渡。
- 若存在未完成 Session、Recovery、需要优先处理的 Permission 页面或错误状态，直接进入对应状态，不播放品牌过渡。
- 仅在正常首次进入或无活动状态时显示短品牌过渡。
- 品牌过渡不设置人为最低等待时间；目标页面可用时允许立即收束，不能阻塞用户继续操作。
- 过渡只允许使用现有 Approved Milo 静态资产、opacity、offset 和简单 UI transition。
- 建议顺序：米白背景 → 爪印淡入/轻移 → 现有 `milo_idle_v1` 整体淡入/轻移 → `Focumi` 淡入 → 进入目标页面。
- 不制作眨眼、探头等新角色帧；Milo 本体保持 Approved 静态图完整，不做局部形变。
- Reduce Motion 开启时使用静态 Milo + Focumi 的最短淡入或直接静态落点。
- 同一进程内前后台切换不重复播放。
- 品牌过渡仅为 presentation state，不可读写业务状态或伪装加载、权限与系统成功。

### 7.2 Meet Milo / Milo 伙伴确认入口

目的：让第一次使用者认识并确认当前唯一伙伴 Milo，同时保留未来伙伴扩展的数据与路由能力。

- 页面标题与文案不得使用“选择伙伴”“选择 Milo”或其他多选暗示。
- 建议语义为“Meet Milo / 认识 Milo”，主操作为“和 Milo 开始”。
- 页面只展示官方 `milo_idle_v1`，不出现选择框、单选态、左右卡片比较或唯一选项被选中的视觉。
- Max 和其他伙伴不显示，不展示灰锁卡、剪影或“即将上线”占位。
- 新用户首次路径为：`打开 → Meet Milo → 任务设置`。
- 新用户默认 Milo；确认后沿用现有 Store 与路由能力进入任务设置。
- 该页面是未来伙伴扩展的兼容入口，不是当前版本的伪选择页。

### 7.3 任务设置

目的：让用户在最少步骤中明确一件事并开始专注。

- 展示官方 Milo Focus/Pact 相关静态资产。
- 用户可输入一个任务目标。
- 专注时长沿用当前业务实现支持的合法值；概念图中的数字不是修改 Timer 规则的授权。
- 现有 Family Controls 权限、App 选择和缺失条件必须继续真实呈现。
- 主按钮为深绿色胶囊“开始专注”，条件不足时说明缺少什么。

### 7.4 专注计时

目的：让 Milo、目标和剩余时间成为三个清晰锚点。

- 使用官方 `milo_focus_v2`。
- 显示目标、倒计时和必要的真实保护措辞。
- v0.6 不新增 Pause 状态或 pause reducer。
- 如果当前业务没有真正暂停 reducer，UI 不展示暂停按钮；概念图中的暂停元素不得进入实现。
- 专注中的用户操作只保留现有必要使用流程和“结束专注”。
- “结束专注”使用柔和橙色，并保留真实结束确认。
- 页面转场、角色反馈和计时显示不得成为 deadline 真值。

### 7.5 返回专注

目的：用户离开后，Milo 无责备地欢迎用户回来并恢复当前目标。

- 使用官方静态 `milo_return_v1`；本轮不生产或接入新的 Return 逐帧资产。
- 显示离开时长、当前目标和真实恢复状态。
- 主按钮为“继续专注”。
- “正在请求恢复保护”与“系统已恢复”必须分开；本地命令回执不能包装成系统成功。

### 7.6 完成庆祝

目的：以低信息密度提供共同完成感，是 v0.6 的核心结束反馈。

- 只使用官方 `milo_complete_v1`，不出现 Max。
- 显示完成标题、本次目标和实际专注时长。
- 不加入金币、等级、奖章货币、烟花或复杂奖励系统。
- 主操作沿用现有 `completionDismissed → setup` 业务行为；默认文案使用“完成”，不得为视觉效果新增状态或自动重开 Session。
- 完成页优先于记录功能；记录缺失不能削弱完成反馈。

### 7.7 专注记录（可选降级面）

目的：仅在现有真实数据足以支持时提供轻量回顾；不属于 v0.6 核心闭环或 Release Gate。

- 不为了匹配概念图强行制作独立复杂记录页。
- 不新增数据字段、统计模型、持久化键或 Dashboard。
- 只展示当前 Store 已经真实支持的数据；不得虚构今日时长、连续天数、趋势或历史明细。
- 使用现有 Approved Milo 静态资产；没有正式睡眠姿态时不得 AI 重画。
- 若数据与详情目的地足够，可展示轻量记录入口。
- 若数据不足，允许降级为空状态、隐藏详情按钮或完全移除入口。
- 记录入口的存在与否不得阻塞 Meet Milo → 设置 → 专注 → 返回 → 完成核心流程。

## 8. Functional requirements

| ID | Requirement | Acceptance |
| --- | --- | --- |
| FR-01 | 新安装用户首先看到 Meet Milo，而非伙伴选择页 | 无“选择”语义、单选控件或唯一选项比较；只展示 Milo 与“和 Milo 开始” |
| FR-02 | 用户确认 Milo 后进入任务设置 | 沿用现有 Store/路由能力；重启后按现有持久化状态进入正确页面 |
| FR-03 | Max 历史数据采用展示层隐藏，不迁移、不删除 | `.dog` Store 值保持原样；无静默覆盖；`.dog` 兼容代码与 Max 资产仍存在 |
| FR-04 | 新用户默认 Milo | 新安装或无历史伙伴值时，正式展示与后续页面均为 Milo |
| FR-05 | 用户可输入目标并选择当前业务支持的合法时长 | 不因概念图改变 Timer 值；条件不足时不能误开始并给出明确提示 |
| FR-06 | 用户可开始一次专注并看到真实倒计时 | deadline 仍由现有 reducer/store 管理，UI 不另建计时真值 |
| FR-07 | 专注页不显示虚假暂停 | 当前无 Pause reducer 时无暂停按钮、无 pause 状态写入；只保留必要使用与结束 |
| FR-08 | 用户可结束当前专注 | 保留确认步骤；结束后执行现有清理流程 |
| FR-09 | 用户离开后可返回当前目标 | 返回 UI 不丢目标；恢复保护状态使用诚实措辞 |
| FR-10 | deadline 到达后显示 Milo 完成页 | 完成只结算一次，重复激活不重复奖励或记录 |
| FR-11 | 记录按真实数据能力降级 | 不新增字段；数据不足时可显示空状态、隐藏入口或不实现独立记录页 |
| FR-12 | 品牌过渡在状态解析后按条件显示 | 未完成 Session、Recovery、Permission 或错误状态直接路由，不播放过渡 |
| FR-13 | 品牌过渡不阻塞操作 | 不设置人为最低等待；目标页面可用时可立即收束 |
| FR-14 | 所有正式页面只引用现有 Approved Milo 资产 | 正式用户路径无 Max 展示、AI 生成角色或新绘 Milo |
| FR-15 | v0.6 不新增 Milo 动画资产 | 新增资产清单无帧列、spritesheet、AI 补帧、骨骼或新姿态 |
| FR-16 | UI 更新不改变系统能力语义 | 无新状态机、reducer、App Group writer/key、entitlement 或持久化 schema |

### 8.1 Max 历史兼容测试要求

实现必须增加或更新测试，至少覆盖：

1. 新用户或无伙伴历史值时默认展示 Milo。
2. 历史 `.dog` 值加载后不被静默改写为 `.cat`。
3. Max 在正式 UI、VoiceOver 节点和可触发入口中不可见。
4. 隐藏 Max 不删除 Max Approved 资产引用能力或 `.dog` 解码兼容。
5. 启动、任务设置、专注、返回和完成的正式展示均解析为 Milo，不改变业务 snapshot 的其他字段。
6. 未来恢复 Max 时，历史 `.dog` 数据仍可被当前兼容代码读取；本轮不要求恢复其 UI。

## 9. Non-functional requirements

### 9.1 Performance

- 系统 Launch Screen 必须立即呈现静态底色。
- 品牌过渡只在状态解析完成且符合条件时显示，不得延迟 Recovery、Permission、错误或未完成 Session。
- 品牌过渡不得设置人为最低等待时间。
- 角色 PNG 复用现有资产目录，避免重复打包同一大图。
- 长时间 Focus 页不运行角色逐帧动画或高频循环动效。

### 9.2 Accessibility

- 所有交互目标至少 44×44pt。
- Milo 装饰图默认不抢 VoiceOver；表达状态时提供简短 label。
- Timer、目标、真实保护状态和主 CTA 的 VoiceOver 顺序优先于角色描述。
- Meet Milo 不得向 VoiceOver 用户呈现“1项中的1项”之类虚假选择语义。
- Dynamic Type 至 AXXXL 不遮挡主 CTA，不裁切关键状态。
- Reduce Motion 下不丢失信息、角色身份和操作；启动过渡使用最短淡入或静态落点。
- 主次与危险操作不可只靠颜色区分。

### 9.3 Privacy and security

- 不新增账号、网络、第三方 SDK 或云端数据。
- 不记录目标正文、所选 App 或权限敏感内容到 Beta 验证日志。
- 不新增 App Group key、writer 或 persistence schema。
- 不迁移、不删除、不静默覆盖历史 `.dog` 数据。

### 9.4 Compatibility

- 最低系统保持当前 iOS 17.0 目标。
- Simulator 只验 UI/流程候选；Shield、通知时机、Live Activity 和后台行为仍需真机证据。

## 10. State and navigation contract

本轮复用当前状态流，不增加平行状态机：

```text
系统 Launch Screen
→ 解析持久化状态 / Session / Recovery / Permission / Error
   ├─ 有未完成 Session 或恢复/异常要求 → 直接进入对应现有状态
   └─ 正常首次进入或无活动状态 → 可选短 Milo 品牌过渡
→ Meet Milo（仅新用户/现有 onboarding 入口）或 setup
→ focusing
→ requestingAccess / accessWindow / focusing
→ completed
→ setup
```

- 品牌过渡只属于本地 presentation state，不是新业务状态。
- Recovery、Permission、错误和未完成 Session 的路由优先级高于品牌过渡。
- v0.6 不新增 Pause 状态。
- Max 隐藏属于展示层策略，不改变 `.dog` 持久化值或现有解码兼容。
- 记录入口是可选展示，不加入核心状态机。

## 11. Primary user flows

### Flow A：首次完成

`冷启动 → 状态解析 → 短 Milo 品牌过渡（仅正常路径）→ Meet Milo → 任务设置 → 开始专注 → deadline 到达 → Milo 完成页 → 任务设置`

### Flow B：离开并返回

`专注中 → 用户触发现有必要使用流程 → 申请/临时访问 → 返回 App → Milo Return 静态姿态 → 请求恢复保护 → 继续倒计时 → 完成`

### Flow C：回访用户

`冷启动 → 状态解析 → 无活动状态可选短品牌过渡 → 任务设置 → 再次开始`

### Flow D：未完成 Session / 异常恢复

`冷启动 → 状态解析 → 未完成 Session、Recovery、Permission 或错误页面 → 用户处理/继续 → 现有目标状态`

Flow D 不播放品牌过渡；品牌 UI 不得覆盖、延迟或伪装恢复与错误状态。

### Flow E：历史 Max 数据

`冷启动 → 读取历史 .dog → 保持 Store 原值 → 正式展示层隐藏 Max并展示 Milo-only体验 → 不迁移、不删除 → 后续版本仍可读取 .dog`

## 12. Success metrics and V-S-C-R positioning

### 12.1 v0.6 implementation/release acceptance focus

V-S-C-R 不是 v0.6 的 Release Gate。v0.6 实现与发布候选验收只关注：

1. 核心流程完整；
2. UI 与已确认参考方向一致；
3. Milo-only 基础陪伴体验清楚且身份一致；
4. 业务与系统状态表达诚实；
5. 历史数据兼容、稳定性、无障碍与恢复路径不退化。

### 12.2 后续 Beta 产品验证指标

真实用户验证留到后续 Beta，并围绕同一人群、同一承诺和同一核心动作：

- **V（传播）**：多个独立内容实验是否重复触发“想和 Milo 一起专注”的明确兴趣；单条播放量不算成立。
- **S（可规模化）**：两周内能否制作约 20 个单变量内容实验；不依赖生产新角色动画。
- **C（转化）**：真实安装并完成 Meet Milo、目标设置和首次专注；点赞、收藏或口头愿用不计入。
- **R（留存）**：无催促情况下，在自然周期内再次启动并完成第二次专注。

Beta 候选指标：

1. 首次打开 → Meet Milo 完成率。
2. Meet Milo → 成功开始首次专注率。
3. 首次开始 → 完成一次专注率。
4. 发生离开 → 成功回到同一目标率。
5. 7 天内无催促二次完成率。
6. 崩溃、恢复失败、重复结算和关键流程中断率。

指标事件必须去标识化，且不能记录目标正文、所选 App 或账号信息。Beta 指标结果不影响 v0.6 实现验收结论，但决定后续产品投入。

## 13. Risks and dependencies

| Risk | State | Mitigation / gate |
| --- | --- | --- |
| 概念图角色与官方 PNG 不一致 | 已确认 | 正式运行时只用现有 Approved Milo 资产；截图逐页核对 |
| 单角色入口仍呈现“选择”语义 | 已阻断 | 改为 Meet Milo / 伙伴确认；移除单选与比较 UI |
| 历史 `.dog` 被静默覆盖 | 已阻断 | 展示层隐藏；不迁移、不删除；增加兼容测试 |
| 概念图暂停进入实现 | 已阻断 | 无 Pause reducer 时不展示暂停；不新增状态或 reducer |
| 新视觉时长误改 Timer | 已阻断 | 沿用当前业务合法值；概念图数字无业务效力 |
| 启动过渡遮挡 Session/Recovery/Permission/Error | 高风险 | 先解析状态；上述路径直接路由且不播放过渡 |
| 启动过渡人为拖延 | 已阻断 | 无最低等待时间；目标页面可用即收束 |
| 新角色动画资产扩大范围 | 已阻断 | v0.6 明确禁止；后续增强另立门禁且不阻断本版本 |
| 记录页展示不存在的数据 | 已阻断 | 仅绑定现有字段；可空状态、隐藏入口或不实现 |
| Shield/Return 被视觉误报成功 | 高风险 | 继续使用请求/回执/设备证据分层措辞 |
| 已确认参考被实现者自行改成新视觉系统 | 高风险 | UI 参考为实现输入；偏离需用户重新批准 |
| 历史 UI/DesignLab/DSH 脏改混入实现 | 高风险 | 开工前审计当前 diff、冻结精确基线和文件 allowlist |

## 14. Development boundaries

实现阶段的候选最小范围：

- 现有 FriendMVP SwiftUI 用户可见页面与其局部 presentation state。
- 现有 Approved Milo 资源的引用、布局与状态映射。
- 系统 Launch Screen 的静态视觉和 App 内条件式品牌过渡。
- 与新 UI、Max 展示层隐藏、启动路由、无障碍直接相关的 CoreTests、fixture 和必要截图证据。

未经新授权禁止：

- 修改 reducer 状态语义，新增 Pause 或其他业务状态、新状态机、新 reducer。
- 修改 Session、Timer、Family Controls、Shield、Return、Live Activity、App Group key/writer 或 persistence schema。
- 修改 entitlement、签名、Target、最低版本、后台模式或第三方依赖。
- 删除 Max 资产、`.dog` 数据或兼容代码。
- 生产新 Milo 动画资产，或引入 Pet Library、AI/自定义宠物。
- 真机、TestFlight、上传、发布、账号和付费操作。

Codex 必须根据已确认 UI 参考实现，不得自行创造新的视觉系统、产品方向、页面或功能。若参考与现有业务真值冲突，以业务真实性和本文冻结规则为准，并在实现前报告差异。

## 15. Release acceptance criteria

开发候选至少满足：

1. Meet Milo、任务设置、专注、必要使用/返回、完成及条件式启动过渡使用同一 Light Mode UI 系统。
2. 首次入口无虚假“伙伴选择”语义；用户自然完成 `打开 → Meet Milo → 任务设置`。
3. 运行时只使用现有 Approved Milo 静态姿态；新增 Milo 动画资产数量为 0。
4. Max 在正式用户路径、VoiceOver 和可触发入口中不可见；Max 资产、`.dog` Store 值与兼容代码未被删除或迁移。
5. 专注页在无 Pause reducer 时不显示暂停；没有新增状态机或 reducer。
6. 核心流程从 setup 到 focusing、必要使用/return、completed 可完成，业务状态与当前 reducer 一致。
7. 启动时先完成状态解析；未完成 Session、Recovery、Permission 和错误路径均不播放品牌过渡。
8. 品牌过渡只使用现有静态 Milo、opacity、offset 和简单 UI transition，不人为阻塞操作。
9. 完成页提供清楚的 Milo 完成反馈；记录功能缺失或降级不阻塞核心闭环。
10. 记录若存在，只使用现有真实数据；无新增字段、Dashboard 或复杂统计。
11. Debug/Release build 和相关 CoreTests 通过；Release 无可触发预览参数。
12. iOS 17 Simulator 完成 UI、Dynamic Type、VoiceOver 候选、Reduce Motion、冷启动与恢复路由验收。
13. Shield、Return、Live Activity、通知和生命周期恢复按风险完成独立真机验证；Simulator 不替代真机结论。
14. 用户对最终运行截图/录屏做视觉验收；概念图或 Preview 不替代。

V-S-C-R 与真实用户留存不属于本节 Release Gate，留待后续 Beta 验证。

## 16. Open questions — implementation review

当前没有待用户决定的产品方向问题。以下是进入实现前必须由实现审计确认的事实，不授权改变本文决策：

1. 当前源码实际支持的专注时长列表及其 UI 绑定位置；实现必须沿用现状，不按概念图改 Timer。
2. 当前已有 Haptic、声音与静音/音频策略的可复用入口；若没有合规现成入口，v0.6 可降级为页面转场，不得为此新增后台能力、第三方依赖或扩大架构。
3. 当前完成页 `completionDismissed → setup` 的具体 UI owner 与文案绑定位置。
4. 当前 DSH、DesignLab 与其他未验收改动的实际 diff、归属和是否与本 PRD 文件 allowlist 冲突。

这些事实由实现前审计解决；若审计发现必须修改冻结业务边界，立即停止并请求用户新授权。

## 17. Approval gate

本文已达到 `READY_FOR_IMPLEMENTATION_REVIEW`，下一步只允许先完成：

1. 当前 DSH/DesignLab/工作树变更审计与基线确认；
2. 页面—现有状态/组件/Approved 资产/UI 参考映射表；
3. 精确文件 allowlist 与分阶段实现任务；
4. Build/Test/Simulator/Device 分层验收计划。

完成实现审查并确认不触及冻结边界后，方可进入 UI 代码修改。本文不授权真机、TestFlight、上传、发布、账号、付款、删除或 Git 外写。
