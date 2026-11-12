# Focumi build 14 截图准备 — 2026-09-06

状态：部分完成，核心流程截图受阻。Owner：本任务 01a07434-8b28-7c80-bf0d-87a56bb1e8d1。

- 源码根：`/Users/USER/Documents/app/自律宠物-iOS`，既有未提交改动保持原状。
- 直接使用现有 Xcode 工程，Release 模拟器 build 成功；产物 Info.plist 为 0.6.0 (14)。未重新生成工程，未修改源码/配置/签名。
- 当前 project.yml 为 build 9，Xcode 工程为 build 14；本次依据后者构建。不能仅凭版本号断言与已提交 archive 字节一致。
- 新建专用模拟器：Focumi-B14-Shots-20260906，D5813DFF-77FA-469F-B4B6-4DD09D70D996，iPhone 14 Plus / iOS 26.5，位于系统默认内置盘 device set。现有模拟器未启动、安装、重置或删除；未重试失败的外接 device set。
- 通过正常 Release UI 输入示例任务 Read one chapter，保存任务设置、伙伴、设置三个原始 PNG。未使用 DEBUG fixture、预览注入、图片重绘或截图内容修改。PNG 尺寸与 SHA-256 见 manifest.json。
- 正常 Screen Time 入口后仍 Not requested；Start focus 禁用。源码 canStart 要求 approved 且 selectedItemCount > 0。未绕过权限，未生成专注中/返回/完成的伪截图。
- 已连接 iPhone 17 的 app 查询仍为 0.6.0 (10)。须先对齐真实设备版本，再通过实际流程补拍核心页面。
- 这三张仅为补充素材，不能宣称解决 Guideline 2.3.3，也不能作为完整重审包。
- 无 App Store Connect 访问、上传、替换或提交。现行拒审状态本轮未实时核验。

## 验证与下一步
Build PASS；Simulator 启动与上述三页 PASS，核心专注流程 BLOCKED；Device 截图 NOT RUN；User Evidence 待确认。截图上传/替换、最终重新提交仍需动作时用户确认。

磁盘：开始内置盘约 35 GiB，截图后约 32 GiB（全盘变化，不能全部归因本任务）。本任务新增 DerivedData/截图/日志约 487 MiB，专用模拟器约 1.8 GiB；均为当前截图复测所需并保留。桌面保存的三个原始文件保留。未删除任何文件。实际 model/effort UNKNOWN。
