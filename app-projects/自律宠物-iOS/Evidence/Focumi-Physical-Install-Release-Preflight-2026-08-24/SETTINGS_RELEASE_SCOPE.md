# Settings release scope — 2026-08-24

## Frozen production surface

The formal Settings page contains exactly four sections:

1. **Companion** — current Milo or Max and the existing Change companion action when the current phase permits it. No relationship-stage, growth, session-count, time, or shared-history presentation remains on this page.
2. **Language** — Follow System, Chinese, and English through the existing app-locale preference.
3. **Focus music** — existing music toggle, track selector, and volume slider.
4. **Permissions & status** — read-only current Screen Time, Notifications, and Live Activities values. These rows have no false affordance: no new action was added because this screen has no existing authorized recovery/authorization action owner.

## Explicitly hidden from formal Settings

- Relationship stage / 陪伴阶段.
- Completed focus sessions / 完成专注次数.
- Time together / 陪伴时间.
- Shared moments with Milo or Max / 共同记录.
- Default focus duration (task setup remains the owner).
- Long permission explanation and background-deadline diagnostic message.
- On-device data / 本机数据, clear data, version, and all diagnostic, technical, and development entry points.

No underlying relationship, history, statistics, clear-data, Session, Timer, Family Controls, Shield, Return, persisted enum, signing, entitlement, version/build, App Icon, or asset behavior was deleted or changed.

## Locale and accessibility checks

- The Settings view continues to resolve visible copy through `FocumiSettingsCopy` and the app-injected locale.
- Milo and Max remain fixed proper names. Music tracks retain the all-case English/Chinese mapping, including `Deep Blue` / `深蓝`.
- Existing textual controls (Change companion, Language picker, music toggle, music picker, volume slider, and Close) retain their native labels and hit targets. The four group headings now expose the VoiceOver header trait.
- Static source check found exactly four Settings groups and none of the explicitly hidden Settings labels in that view range.
- No UI-hierarchy or VoiceOver runtime interaction tool was available; layout, touch behavior, and VoiceOver traversal require physical human review.

## Fresh tests and builds

- Full CoreTests result: `totalTestCount: 97`, `failedTests: 0`, `skippedTests: 0`, `result: Passed`.
- Result bundle: `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-SettingsReleaseScope-20260824/Results/SettingsReleaseScopeCoreTests-Retry.xcresult`.
- Simulator Debug build: `PASS` (`SIMULATOR_BUILD_EXIT=0`).
- Physical Debug build: `PASS` (`BUILD_EXIT=0`).
- The first test attempt identified and recorded one extra Settings closing brace; the second full test run is the passing source-of-truth result above.

## Physical candidate

- Device: `XXXTENTACION` / physical iPhone 17 (`iPhone18,3`) / iOS 27.0; wired, connected, paired, and Developer Mode enabled.
- Source HEAD: `6c84950615a0132878e38772007d288ccc381967`.
- Source diff fingerprint excluding `Evidence/**`: `27d3a1287858a6cc8e2d7ff7547c9b6517ac5e424ebc080db376ad1ed00e3af9`.
- Settings-scope source/test diff fingerprint: `5a30e15c5bc0a273bc752d9d5fc16b88b05e7677e1c1dd47b34f051c13043165`.
- Built app: `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-SettingsReleaseScope-20260824/Build/Products/Debug-iphoneos/DisciplinedPet.app`.
- Bundle/version/build: `com.cczij.disciplinedpet`, `0.6.0 (10)`.
- Executable SHA-256: `e5326e48ffe83afe5210ba8a259563ef97d069b8b701d5c599bfe92b0fe30113`.
- Install: `PASS` (`INSTALL_EXIT=0`) by non-destructive overwrite; no uninstall or clear-data command was issued.
- Launch: `PASS` (`LAUNCH_EXIT=0`); subsequent device process listing showed the app and its Live Activity extension running from the new installed container.
- Disk after build/install: 11 GiB available, above the 10 GiB stop threshold.

## User review checklist

1. In English and Chinese, confirm the page contains only Companion, Language, Focus music, and Permissions.
2. Confirm Milo/Max names, Settings/Close, and `Deep Blue` / `深蓝` follow the selected app language rules.
3. Confirm no stage, counts, time, shared moments, default duration, on-device data, clear-data, version, or diagnostics appear.
4. With VoiceOver enabled, confirm four headings are announced as headings and that Change companion, language, music, and Close controls are reachable and descriptive.

## Logs

- `SETTINGS_RELEASE_SCOPE_CORETESTS.log`
- `SETTINGS_RELEASE_SCOPE_CORETESTS_SUMMARY.json`
- `SETTINGS_RELEASE_SCOPE_SIMULATOR_BUILD.log`
- `SETTINGS_RELEASE_SCOPE_DEVICE_BUILD.log`
- `SETTINGS_RELEASE_SCOPE_DEVICE_CANDIDATE.log`
- `SETTINGS_RELEASE_SCOPE_DEVICE_INSTALL.log`
- `SETTINGS_RELEASE_SCOPE_DEVICE_LAUNCH.log`

## Status

`SETTINGS_RELEASE_SCOPE_DEVICE_REVIEW_REQUIRED`

```text
Implementation: DONE
Build: PASS
Tests: PASS
Simulator: PASS (build plus static accessibility check; no interactive UI session)
Device: PASS (install, launch, and process presence)
User Evidence: NOT TESTED
UI / VoiceOver runtime review: HUMAN REVIEW REQUIRED
```
