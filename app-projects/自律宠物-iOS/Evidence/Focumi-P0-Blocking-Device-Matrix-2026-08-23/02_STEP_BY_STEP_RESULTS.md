# 逐步结果

## 候选与设备门禁

- Implementation：`NOT CHANGED`。本轮未改源码、SwiftUI、资产、工程、scheme、entitlements 或版本。
- Build：`PASS`。独立临时 DerivedData，Xcode 日志含 `BUILD SUCCEEDED`。
- Tests：`NOT RUN`。本轮目标是真机矩阵且不改代码；构建前未用 Simulator 或测试替代设备证据。
- Simulator：`N/A`。指定物理 iPhone 17，未使用模拟器代替。
- Device：构建、覆盖安装、启动 `PASS`；行为矩阵仍在执行。
- Distribution：`UNKNOWN / NOT CHECKED`。
- User Evidence：步骤 2、3 为用户报告 PASS，证据边界见矩阵。

## 时间线

1. 2026-08-23T08:10:53Z：冻结 Git/dirty/untracked 基线。HEAD `6c849506...`，6 个 tracked modified，1498 个既有 untracked。
2. 实时发现唯一物理 iPhone 17；iOS 27.0（24A5408d），connected/paired、wired、booted、Developer Mode Enabled。
3. 候选身份冻结：`project.yml` 0.6.0 (9)，实际 Xcode project/build 0.6.0 (10)。未运行 xcodegen。
4. 2026-08-23T08:11:45Z 起：真机 Debug 构建；日志 `BUILD SUCCEEDED`。
5. 2026-08-23T08:13:28Z 起：覆盖安装当前候选，未卸载、未清数据；安装与启动成功。
6. 初始稳定截图显示任务设置页及“专注时限制 13 个应用”。该截图不能单独证明授权或 Shield。
7. 用户报告最短路径：选择受限 App → 开始专注 → 打开受限 App → 真实 Apple Shield 出现。

## 证据文件

- 候选 dirty 状态：`logs/baseline_git_status.txt`
- 候选内容 SHA-256：`logs/baseline_dirty_content_sha256.tsv`
- Xcode build：`logs/xcodebuild_device_build.log`
- 产物身份：`logs/built_products_identity.tsv`
- 安装/启动：`logs/devicectl_install.log`、`logs/devicectl_launch.log`
- 初始截图：`screenshots/00_initial_stable.png`

## 录屏边界

当前 `devicectl` 对该设备返回 `Screen Recording capability not supported`。用户未提供系统录屏，因此步骤 2、3 只记录为 `PASS / USER-REPORTED`，不伪装成独立 Device 证据。
