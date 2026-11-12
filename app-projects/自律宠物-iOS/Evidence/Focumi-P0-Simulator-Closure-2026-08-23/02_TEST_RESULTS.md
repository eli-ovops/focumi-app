# Test results

- CoreTests: PASS — 78 tests / 6 suites on Simulator UDID `30A2AAB4-3CFF-4629-AA1C-9B3716F0CB9E` (iPhone 15 Pro). `logs/coretests-final-run.log`.
- Debug Simulator build: PASS — explicit iPhone 17 UDID `F3BD6C9B-FAB9-44EA-8C05-AEA2D4759027`. `logs/debug-build-final-2.log`.
- Release Simulator build: PASS — same explicit iPhone 17 UDID. `logs/release-build-final-2.log`.
- `git diff --check`: PASS. `logs/diff-check-final.log`.
- Reducer coverage includes no-selection/authorization start guards, necessary access and return/reapply, idempotent completion, early end without completion, and restored state reconciliation.
