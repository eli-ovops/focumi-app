# Simulator flow matrix

Simulator app-under-test: iPhone 17, UDID `F3BD6C9B-FAB9-44EA-8C05-AEA2D4759027`.

| Flow | Evidence | Status |
| --- | --- | --- |
| Milo/Max explicit choice and Max persistence projection | `17-onboarding-max-selection.png`, `15-waiting-max.png`, `16-completion-max.png`; static-map reducer test | PASS |
| Permission denied | `04-permission-denied.png` | PASS — app-owned denied branch |
| No restricted app selected / start disabled | `05-zero-selection-disabled.png` | PASS — app-owned zero-selection branch |
| Approved with one selected item / Pact enabled | `06-approved-selected-pact.png` | PASS — fixture projection |
| Start focusing | `07-focus-started.png` | PASS — fixture projection |
| Necessary Access / Waiting | `08-necessary-access.png`, `09-waiting-milo.png` | PASS — app-owned reducer screens |
| Return to focus / re-protection request | `10-return-relock-requested.png` | PASS — app-owned return branch |
| Relock failed | `11-relock-failed.png` | PASS — honest failure UI, no Shield assertion |
| Relock unknown | `12-relock-unknown.png` | PASS — honest unknown UI, no Shield assertion |
| Natural completion settles once | `13-natural-completion-once.png` + reducer idempotency tests | PASS |
| Early end does not settle completion | `14-early-end-no-completion.png` + reducer tests | PASS |
| Lifecycle/restart restoration | CoreTests (78 / 6) | PASS — reducer/persistence layer |

All PNGs are DEBUG Simulator fixtures. Their on-screen `模拟器验证状态` badge explicitly limits proof to App UI/reducer projection; none is Apple Shield, FamilyActivityPicker, or ManagedSettings evidence.
