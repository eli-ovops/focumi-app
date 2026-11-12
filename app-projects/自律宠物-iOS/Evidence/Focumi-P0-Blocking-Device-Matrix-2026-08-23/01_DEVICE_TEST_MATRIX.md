# Focumi P0-1 真机 App Blocking 矩阵

候选：`6c84950615a0132878e38772007d288ccc381967`，dirty worktree，实际构建 `0.6.0 (10)`。

设备：唯一物理 iPhone 17（iPhone18,3），iOS 27.0（24A5408d），有线 connected/paired。

状态只使用 `PASS / FAIL / NOT TESTED / BLOCKED`。`PASS / USER-REPORTED` 仅表示用户明确报告完成；没有独立录屏时不等同于独立 Device PASS。

| 顺序 | 步骤 | 状态 | 证据层 | 当前证据与边界 |
| --- | --- | --- | --- | --- |
| 1 | 首次拒绝 | BLOCKED | Device | 覆盖安装前设备上已存在 0.6.0 (10) 与持久状态；启动后可见已限制 13 个应用。未获卸载/清数据授权，不能制造首次安装/首次拒绝条件。 |
| 2 | 重试批准并选择受限 App | PASS | User Evidence | 用户明确报告已选择受限 App；App 名称待补。无独立录屏，不升级为独立 Device PASS。 |
| 3 | 开始专注并验证真实 Shield | PASS | User Evidence | 用户明确报告：开始专注后打开受限 App，真实 Apple Shield 出现。无独立录屏，不升级为独立 Device PASS。 |
| 4 | 未受限 App | NOT TESTED | — | 下一项。 |
| 5 | 前后台 | NOT TESTED | — | — |
| 6 | 杀进程恢复 | NOT TESTED | — | — |
| 7 | Shield secondary action | NOT TESTED | — | — |
| 8 | 提交必要访问并真实解除 | NOT TESTED | — | — |
| 9 | Return 并真实 relock | NOT TESTED | — | — |
| 10 | 自然完成单次结算 | NOT TESTED | — | — |
| 11 | 提前结束不结算 | NOT TESTED | — | — |
| 12 | 专注中撤权/恢复与 generation/intent/receipt 隔离 | NOT TESTED | — | — |

Distribution：`UNKNOWN / NOT CHECKED`。
