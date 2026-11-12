# Focumi v0.6 Visual Experience Reset PRD

> 文档类型：Visual decision contract
>
> 状态：`VISUAL_PRD_APPROVED / PHASE_1_AUTHORIZED`
>
> 日期：2026-08-16
>
> 设计基准：Light Mode

## 0. 决策效力

- 本文重新定义 Focumi v0.6 的视觉体验，不是完整业务或工程 PRD。
- 本文不授权 SwiftUI、资产、动效、业务真值、版本、设备、发布或测试操作。
- 本文不重新设计 Milo/Max，不恢复 Toto/Pomeranian，不开始任何 Phase。
- 用户批准的高保真视觉目标才是后续实现的唯一视觉真值。
- 未经用户批准的视觉推断，不得进入实现或成为 fallback。

## 1. 来源、事实与边界

### 1.1 本轮来源

- [事实] 用户完整原始指令：本轮指定附件 `pasted-text.txt`。
- [事实] 2026-08-13 Experience Execution PRD 与既有正式宠物资产审计。
- [事实] 当前工程项目规则及已存在的 Light UI、Focus、Completion 截图。
- [事实] `current-max-light-before.png` 是被拒绝的旧 Completion 视觉证据。
- [事实] `completion-b.png` 是已选的 Completion 静态方向。
- [事实] 最新 Completion/Focus 运行截图是既有表现证据，不构成新系统授权。

### 1.2 本轮没有做

- 未联网、未检索竞品、未访问账户、未操作设备。
- 未生成图片、动画、A/B/C 视觉稿，未修改 App、SwiftUI、资产或业务逻辑。
- 未读取 `.env`、secret、token、cookie、SSH key 或任何凭证。
- 未虚构用户研究、竞品数据、商业指标、Dark Mode 或真机结论。

### 1.3 已知事实与判断

- [事实] Milo 是正式橘色虎斑猫，配鼠尾草绿领巾。
- [事实] Max 是正式黑白哈士奇幼犬，配灰蓝格纹领巾。
- [事实] `.cat` / `.dog` 是兼容标识；展示层中的 Dog 对应 Max。
- [事实] 正式静态资产覆盖 Idle、Pact、Start、Focus、Waiting、Return、Complete、Tap、Cancel。
- [判断] 当前问题是系统性层级与装饰密度错误，不是单点调色或间距问题。
- [判断] Completion B 的角色主导、暖奶油留白、低信息密度是局部正例。
- [待用户选择] Phase 1 的单一高保真方向。
- [待用户选择] Phase 2 跨页视觉系统及其冻结值。

## 2. 第一性原理

### 2.1 根目标

让用户自然感到：这是一个温暖、可信、愿意每天打开的 Focus App；Milo 或 Max 正在和我完成一件事。

### 2.2 必要条件

- 先看见角色，再看懂目标。
- 不读装饰也能找到 Timer、真实状态与下一步。
- 角色活在页面构图中，而不是被放进一个 UI 图片容器。
- 故事感来自角色、构图、留白、字阶、色彩和少量手作细节。
- 装饰不得先于目标、Timer、CTA 或异常状态被看见。

### 2.3 优先级与配比

1. Character first：Milo/Max 及当前角色行为。
2. Clarity first：目标、关键真实状态、Timer、操作可立即读取。
3. Emotion first：温柔、共同投入、轻盈收束。
4. Decoration last：只服务前三项，且可被删除。
- 85–90%：清晰度、角色、构图、留白和层级。
- 10–15%：克制的手作与故事书个性。
- 0%：以装饰数量证明 vintage 或 editorial。

## 3. 核心情绪与正式 Light Mode

### 3.1 核心情绪

安静的共同投入，带一点被陪伴的温度；不是热闹的奖励游戏，也不是怀旧物件展览。

### 3.2 保留的精神

- warm：干净暖奶油与低饱和关系色。
- nostalgic：极轻纸感与正式手绘线条。
- gentle：不责备、不过度庆祝、不用惊吓式反馈。
- handmade：每屏最多一笔可感知的手作细节。
- storybook-like：来自角色与场景，而非纸条、标签、边框的机械复述。

### 3.3 Light Mode 合同

- 连续、干净的暖奶油底面；四角不脏、不压字、不像纸片叠层。
- 仅允许极轻纸张纹理；它不是一个独立 UI 元素。
- 文本使用清晰暖深棕/墨色关系，不使用低对比棕上棕。
- 草莓/珊瑚、雾蓝、鼠尾草只承担操作、必要状态或角色关系。
- 标题可有轻微 storybook 气质；正文、Timer、CTA 必须现代、清晰、可读。

### 3.4 Dark Mode 暂缓

- [事实] 旧 Dark Mode 被判定为给 Light Mode 套深棕滤镜，不是独立可读系统。
- Phase 1/2 只冻结 Light Mode 的层级、构图、容器和颜色关系。
- Dark Mode 不得用反色、深棕覆盖或自动套色视为完成。
- Light Mode 跨页系统经用户通过后，Dark Mode 才能单独被设计与验证。

## 4. 当前失败与永久弃用

### 4.1 当前失败的根因

- 深棕半透明 panel 与大面积抽象纸条降低可读性。
- divider、标签、缝线与边框被重复用来伪造组织。
- 大型椭圆 pet stage 把角色缩成可替换插图。
- 每节被框住，页面失去连续叙事与呼吸。
- 目标、Timer、CTA 与宠物互相争抢，而非形成阅读路径。
- 绘本上半屏与表单/卡片下半屏使用两套冲突语法。
- Settings 像复古实验，不像平静、原生、可扫描的工具页。

### 4.2 永久弃用

- deep-brown translucent panel system、褐色滤镜式 Dark Mode。
- oversized abstract paper strips、giant oval pet stage。
- card wall、dashboard、poster-inside-app、glassmorphism。
- 非功能性 vertical grid、每节 divider、密集 floating editorial label。
- 票券、缝线、书签、印章、贴纸的机械组合和 scrapbook clutter。
- corporate SaaS、cyber/AI gradient、plastic 3D、廉价 kawaii 模板感。
- Toto/Pomeranian、旧 3D 连帽衫角色、任何重画 Milo/Max 的路线。

## 5. 角色、信息、卡片与装饰合同

### 5.1 Milo/Max 的角色

- 是页面的情绪主角与当前阶段的具象表演者。
- 不是图标、卡片插图、占位 PNG、横幅或椭圆展示台对象。
- 共同情绪相同，物种表达不同：猫以眼神/低重心/爪，幼犬以耳朵/胸肩/宽爪。
- 既有正式姿态与自然接触关系是不可变输入。

### 5.2 固定信息层级

1. Milo/Max 的当前行为。
2. 用户目标。
3. Timer 或当前关键真实状态。
4. 主 CTA。
5. 必要辅助信息与异常提示。
6. 装饰人格。
- 角色表情、色彩、触感和动效不得声明 Shield/Return 成功。

### 5.3 Card 使用条件

- 仅当它解决输入分组、选项比较、异常提示、设置单元或系统必要选择时使用。
- 不得仅为包住宠物、标题、段落或“看起来完整”而使用。
- 不得以半透明、描边、阴影、纸条代替信息层级。
- 默认用间距、对齐、尺度、字阶、留白、色彩关系与极轻背景分组。

### 5.4 Decoration density 阈值

- 每页最多一个清晰可辨识的 decorative motif。
- 一屏最多一处非功能性手作细节；背景纹理不计为 motif。
- 装饰面积不得超过首屏可视面积的 10%。
- 装饰不得包围、遮挡或竞争标题、目标、Timer、CTA。
- 删除后不损功能或故事的装饰，必须删除。
- 不得用 label、divider、card、图标四次强调同一信息。

## 6. 页面合同

每页均以 first glance、emotional goal、information hierarchy、pet role、primary action、maximum decoration density、prohibited elements 约束。

### 6.1 Onboarding

- first glance：一个正式宠物选择与“这是陪你专注的伙伴”。
- emotional goal：熟悉、被欢迎、愿意开始。
- information hierarchy：角色选择 → 产品承诺 → 必要权限解释 → 主 CTA。
- pet role：正面、等权、足够大；传达身份而非装饰。
- primary action：选择并继续。
- maximum decoration density：极轻背景纹理；0 个额外贴纸/标签。
- prohibited elements：角色海报卡、游戏奖励、Toto、权限墙式卡片堆叠。

### 6.2 Home / Focus Pact

- first glance：我要和这只宠物一起完成一件事。
- emotional goal：共同承诺，不是填写 dashboard。
- information hierarchy：宠物注意目标 → 目标输入 → 时长/必要选择 → 开始 CTA。
- pet role：对目标有注意与自然接触，不占独立展示台。
- primary action：开始这次专注。
- maximum decoration density：角色已有正式场景承担唯一自然细节；无额外 motif。
- prohibited elements：dashboard、输入卡墙、大横幅、椭圆舞台、密集系统标签。

### 6.3 Start

- first glance：我们已开始向同一件事投入。
- emotional goal：被轻轻带入，不被庆典打断。
- information hierarchy：目标持续可见 → 角色进入陪伴姿态 → Timer 出现 → 结束入口。
- pet role：从 Pact 自然接到 Focus；不承诺系统保护成功。
- primary action：无新主操作；保持会话可控。
- maximum decoration density：0 个独立装饰；转场与留白承担气氛。
- prohibited elements：全屏庆祝、加载海报、动效替代状态、阻塞 CTA。

### 6.4 Focus

- first glance：pet + goal + timer 三个核心锚点。
- emotional goal：安静、在场、可持续专注。
- information hierarchy：角色 → 目标 → 倒计时 → 结束 CTA → 必要异常状态。
- pet role：正式 Focus pose；未来低频生命感须经独立角色表演批准。
- primary action：结束当前专注。
- maximum decoration density：极轻纹理；0 个独立装饰图形。
- prohibited elements：状态卡片墙、正常状态保护文案容器、接触横条、椭圆舞台、循环贴纸。

### 6.5 Waiting

- first glance：它还在等我，目标还在。
- emotional goal：无责备的守候与可回归感。
- information hierarchy：Waiting 角色 → 目标 → 返回条件/真实状态 → 返回 CTA。
- pet role：守候、低重心、保留页面关系；不失望、不焦虑。
- primary action：返回一起专注。
- maximum decoration density：0–1 个自然场景细节；无 editorial motif。
- prohibited elements：冗长解释、惩罚语气、流程图、失落表情、纸条/卡片叠层。

### 6.6 Return

- first glance：它发现我回来了。
- emotional goal：被识别、重新投入、安顿下来。
- information hierarchy：角色 Recognition → 目标/真实请求状态 → 回到 Focus 的下一步。
- pet role：唯一情绪焦点；Milo 眼神/爪先行，Max 耳朵/胸肩/宽爪先行。
- primary action：继续专注或等待真实状态完成。
- maximum decoration density：0 个独立装饰；角色表现与留白足够。
- prohibited elements：动画结束即显示“已保护”、拟人化动作、卡片总结、视觉烟花。

### 6.7 Completion

- first glance：我们一起完成了。
- emotional goal：低信息密度、高情绪回报、轻盈收束。
- information hierarchy：完成标题 → Completion 角色场景 → 完成目标 → 本次时长 → 主 CTA → secondary。
- pet role：使用各自正式 Completion pose；印章/纸张只来自已有自然接触关系。
- primary action：再次一起专注。
- maximum decoration density：极轻纸感；0 个额外装饰符号。
- prohibited elements：总结大卡、重复解释、第二 outlined button、椭圆舞台、奖励货币、烟花、贴纸。

### 6.8 Settings

- first glance：平静、可扫描、原生可用的偏好设置。
- emotional goal：掌控而不被打扰。
- information hierarchy：设置分组 → 当前值/控制 → 必要说明 → 微小宠物 presence。
- pet role：微小、非抢焦点的身份提示；不是海报。
- primary action：修改当前设置或返回。
- maximum decoration density：0 个独立 motif；只保留色彩、字阶、间距、微小角色存在。
- prohibited elements：editorial poster、巨幅角色、纸条、缝线、装饰分隔线、卡片堆叠。

## 7. Motion hierarchy

1. Milo/Max 的真实 character performance。
2. 页面与状态之间清楚、短促的 transition。
3. 按钮按压、Timer 变化等克制 UI feedback。
4. decoration motion。
- 第四层默认没有，永远不能先于前三层被加入。
- 禁止 scale bounce、悬浮贴纸、循环装饰动画制造活泼感。
- Reduce Motion 直接落在信息与角色身份完整的静态状态。
- 动效不得遮挡、延迟或取消核心 CTA。

## 8. 高保真流程与放行

### 8.1 Phase 1 — Visual Direction

- 仅为 Home / Focus Pact 制作三份明显不同的高保真静态方向稿。
- 三份都必须符合本文；本轮不生成任何方向稿。
- 用户判断：第一眼吸引力、购买欲、角色存在感、日常打开意愿、成熟度。
- 不考虑代码实现难度，不进入 SwiftUI，不生成正式资产。
- 放行：用户明确选定一个方向，且它通过 §9 的高保真验收。

### 8.2 Phase 2 — Visual System Validation

- 仅基于选定方向制作 Focus、Waiting、Completion、Settings 高保真稿。
- 五页必须像同一个 App，不是独立海报。
- 冻结颜色、字体、留白、容器、按钮、宠物尺度、插画位置、装饰阈值、motion intent。
- 放行：用户确认跨页系统；未通过项逐一修正，不代用户选择。

### 8.3 Phase 3 — SwiftUI Faithful Implementation

- 仅在用户选定 Phase 1 且批准并冻结 Phase 2 后开始。
- Codex 只忠实实现 approved visual target，不二次设计。
- 每页先映射已批准目标、状态变体、辅助功能边界到既有表现层。
- 业务真值、Milo/Max 身份、已冻结动作语义保持不变。
- 放行：实现与批准稿同屏比较，无 P0/P1 后才扩展下一页。

## 9. 高保真验收与偏差修正

### 9.1 必须通过

- 三秒内读出角色、目标、Timer/关键状态、主 CTA 的层级。
- Milo/Max 第一眼可辨认；不被裁切、背景或容器削弱。
- 每页只有一个主视觉情绪与一个主操作重心。
- 功能主要依靠留白、对齐、尺度、字阶组织。
- 无 §4.2 永久弃用元素；Light Mode 干净、轻、可读。
- 普通与最大辅助字号的构图计划中，关键文本、角色、CTA 均可达。

### 9.2 同屏比较

- 只比较同一页面、角色、主题、设备尺寸。
- 左侧是唯一 approved visual target，右侧是候选稿或实现截图。
- 顺序固定：层级 → 构图 → 字体 → 色彩/对比 → 角色身份 → 容器/装饰 → 可达性。
- 不得用“整体感觉差不多”跳过任何项目。

### 9.3 P0/P1/P2

- P0：角色身份错误、目标/Timer/CTA 不可读或不可达、错误业务暗示、永久弃用元素；必须修正。
- P1：层级错位、容器滥用、装饰超阈、页面不像同一系统；必须修正后再扩大。
- P2：纹理、微间距、非功能细节不一致；本页收口前修正。
- P0/P1/P2 不得以“先实现再说”转移到下一页。

## 10. 红队：防止 PRD 漂亮而 UI 丑

- 风险：Codex 把抽象词自行翻译为更多复古元素。
- 阻断：approved visual target 高于文字；未批准稿不得补全或混搭。
- 风险：为组织页面自动加 card、label、divider、纸条、motif。
- 阻断：新增元素必须证明解决功能或角色叙事；不能证明即不加。
- 风险：从多个旧图拼出“临时系统”。
- 阻断：每页只对照一个批准目标；被拒方向只作反例证据。
- 风险：实现时稀释正式宠物身份。
- 阻断：Milo/Max 正式资产不可变，不得重画脸型、花纹、比例、领巾。
- 风险：视觉 QA 只看感觉，不修关键偏差。
- 阻断：强制 §9 同屏比较与 P0/P1/P2 清零，再扩大范围。

## 11. 十四个明确回答

### 11.1 新视觉的核心情绪是什么？

安静而温暖的共同投入：我和 Milo/Max 一起完成一件事。

### 11.2 为什么当前版本看起来失败？

装饰、容器和复古词汇超过角色、信息、可用性，造成浑浊、碎片和模板感。

### 11.3 哪些旧视觉元素永久弃用？

§4.2 所列深棕 panel、纸条、椭圆舞台、卡片墙、密集标签/分隔线、滤镜式 Dark Mode。

### 11.4 哪些视觉精神继续保留？

温暖、怀旧、手作、克制故事书感、轻纸感与正式手绘角色。

### 11.5 Milo/Max 在 UI 中承担什么角色？

主视觉情绪和当前阶段的表演者，不是卡片插图或装饰。

### 11.6 功能信息与角色如何建立层级？

角色 → 目标 → Timer/真实状态 → 主 CTA → 辅助信息 → 装饰。

### 11.7 页面什么时候可以使用 card？

仅在 card 解决输入、比较、异常、设置单元或系统必要选择时。

### 11.8 decoration density 如何控制？

每页最多一个 motif，装饰面积不超过首屏 10%，可删不损功能/故事即删除。

### 11.9 Home/Focus/Waiting/Return/Completion/Settings 分别应该是什么感觉？

共同承诺、安静陪伴、无责备守候、被发现后的重新投入、轻盈共同完成、平静可扫描。

### 11.10 Light Mode 的正式方向是什么？

干净暖奶油、极轻纸感、清晰字阶、克制关系色与大而自然的正式角色。

### 11.11 Dark Mode 为什么暂缓？

旧方案未建立独立对比与阅读逻辑；Light Mode 跨页系统尚未冻结。

### 11.12 高保真设计稿如何验收？

用三秒层级检查、同屏比较、P0/P1/P2 修正闭环，不靠主观“差不多”。

### 11.13 什么条件下才允许 Codex 修改 SwiftUI？

用户选定 Phase 1、批准并冻结 Phase 2 跨页视觉系统之后。

### 11.14 如何避免再次出现“PRD 很漂亮，实际 UI 很丑”？

approved visual target 高于文字；禁止自由加元素；逐页同屏比较并清零 P0/P1。

## 12. 非目标、停止条件与状态

- 非目标：Dark Mode、真机、TestFlight、发布、业务真值改写、角色重设计、资产删除、动效生产。
- 停止：用户未选方向；高保真稿含永久弃用元素；跨页系统未通过；方案要求改写真值或重设计角色。
- 当前状态：`VISUAL_PRD_APPROVED / PHASE_1_AUTHORIZED`。
- 之后唯一允许的下一步：用户批准本文后，再由用户授权启动 Phase 1 的高保真方向探索。
