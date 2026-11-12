# Build 14 真机截图进度 — 2026-09-06

用户已明确授权将连接的 iPhone 17 更新安装为 build 14，保留数据并补拍截图。

- 既有工程 Release / iphoneos build PASS；codesign verify PASS。未修改源码/工程/签名配置，未使用 provisioning updates。
- devicectl 原位 install PASS；未卸载、擦除或清理手机数据。安装后 info apps 确认为 com.cczij.disciplinedpet，0.6.0 (14)。
- process launch PASS；Xcode Devices 显示 build 14。
- Xcode Take Screenshot 成功保存 1206 x 2622 的任务设置页。此图为中文且包含系统浮层，仅为启动证据，不适合直接提交商店。
- iPhone 镜像显示 iCloud 未在同步，无法由 Mac 直接操作真机界面。未改动 iCloud 账户或安全设置。
- 正等待用户在手机上切为 English、填入示例任务、选择本次限制应用并开始专注；随后可继续由 Xcode 截图。
- 未验证所有原有数据内容，不以未执行清除等同完整数据迁移验收。
- 截图包尚未完成；无 App Store Connect 上传、替换或提交。

13:56 真机截图已确认：英文示例任务 Read one chapter，Limit 1 apps during focus，Start focus 已启用。已保存 device/01-task-setup-ready-en.png；尚未进入专注中。

13:59 真机已进入 Focusing together，Read one chapter，倒计时 29:39。保存 device/02-focusing-en.png。仅证明该页面和计时显示，不证明系统 Shield 生效。图含 AssistiveTouch 和非 Focumi 的灵动岛活动，暂为候选/证据，最终商店图应重拍清洁状态。

14:00 真机已观察到 Focumi 系统拦截页，含返回专注/申请使用，保存 device/03-shield-observed-zh.png。这仅证明本次选定 App 的拦截页面。该页仍中文、正文对比度较低，并有系统浮层；不作为英文商店最终图。未更改代码或系统语言。

14:02 已拍摄英文 Step away temporarily 申请页，示例理由 Look up study material 已选中，Keep my place 可见。保存 device/04-necessary-access-en.png；系统浮层仍存在，底部次级按钮部分超出当前视口。尚未证明临时访问已批准或恢复保护。

14:05 已拍摄实际临时访问状态：Milo is waiting here，Temporary access remaining 59:42，Focus together again / Finish here。保存 device/05-temporary-access-mixed-language.png。发现英文设置下正文仍为中文（Milo 在这里等你…），为实测本地化问题；不直接作为英文商店最终图，未修代码。AssistiveTouch 浮层仍在；无此前灵动岛外部活动。未验证受限 App 实际解锁或恢复保护。

14:09 已拍摄返回后的 Focusing together 页面，Read one chapter，倒计时 22:43，保存 device/06-resumed-focus-en.png。仅证明 App 返回专注态及计时显示，尚未复验系统重新拦截。系统活动横幅已无，但 AssistiveTouch 浮球仍在；需清洁重拍作为商店候选。未提前结束会话。

14:12 已补拍干净英文专注页，倒计时 19:11，无 AssistiveTouch 和无关灵动岛活动，保存 candidates/01-focusing-en-clean.png（1206×2622），原始像素未修改。为用户待审候选，尚未验证 ASC 目标截图槽尺寸或上传。

14:15 已补拍英文申请页，无 AssistiveTouch，保存 device/07-necessary-access-en-no-assistive-touch.png。左上仍有 iOS 返回来源 App 的导航标记，底部次级按钮部分超出视口。保留原图，不修图移除。最终候选需从主屏重新进入后复拍。

14:19 已补拍无浮球、无来源 App 标记的英文申请页，保存 candidates/02-necessary-access-en-clean.png。主按钮完整可见，次级 Continue with Milo 位于滚动内容底部、当前视口仅部分可见；保留真实布局。现有干净真机候选为专注中、申请使用两张；完整截图包仍待完成页及用户审阅、ASC 尺寸匹配。未上传。

14:32 当前真机显示 One quick question 的 beta 问卷，包含 TestFlight 和付费意向文案。保存 device/08-post-session-beta-survey.png，仅记录界面存在，不将默认选项当作用户回答/付费证据。未提交问卷；完成结果页被问卷遮挡，待用户 Skip 后拍摄。

14:34 跳过问卷后已拍到 Finished together / Read one chapter / 30 min / Done，保存 candidates/03-completed-en-clean.png，无系统浮层。三张干净英文核心候选采集完成：专注中、申请使用、完成。候选待用户确认，ASC 尺寸与页面状态未核验，未上传或重新提交。此证据不替代系统保护解除/恢复全链路验收。

用户已确认 SCREENSHOT_REVIEW.md 中三张干净英文核心截图的画面；该确认不等同上传或最终重审提交授权。
实时核对 Apple 官方截图规范：1206×2622 属于 6.3 英寸；6.5 英寸为 1284×2778 或 1242×2688，未提供 6.9 英寸截图时为必需。6.9 英寸接受 1260×2736、1290×2796、1320×2868。尚未转换原图，也未验证具体版本媒体槽位。来源 https://developer.apple.com/help/app-store-connect/reference/app-information/screenshot-specifications/ 。
当前 Chrome App Store Connect 重定向至登录页，authResult=FAILED。等待用户登录后继续只读核对 Focumi 版本及截图槽位；无上传/替换/提交。

用户明确授权本地等比缩放补边。三张已输出 upload-iphone65-en/，1284×2778 RGB PNG/sRGB，内容缩至1278×2778、左右各补3像素同色边；无裁剪、无重绘，原图保留。asc screenshots validate 返回 readyFiles=3，errorCount=0，warningCount=0；逐张视觉检查通过。尚未上传。具体转换和 SHA-256 见 resize-manifest.json。
