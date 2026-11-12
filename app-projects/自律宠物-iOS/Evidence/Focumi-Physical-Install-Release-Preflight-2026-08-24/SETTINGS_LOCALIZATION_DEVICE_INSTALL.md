# Settings localization physical Debug install — 2026-08-24

## Scope and non-goals

- Scope: a fresh local Debug build from the current working tree, non-destructive overwrite install, and normal launch on the one verified physical device.
- No source, resource, test, version/build, signing, entitlement, account, device-data, TestFlight, App Store, or deployment changes were made by this task.
- The install command did not uninstall the existing app and did not issue any clear-data command.
- UI/localization behavior remains `HUMAN REVIEW REQUIRED`; build, installation, and a running process do not prove the Settings content.

## Realtime device verification

- Device: `XXXTENTACION` / physical iPhone 17 (`iPhone18,3`) / iOS 27.0 (`24A5408d`).
- UDID: `00008150-0001095A360A401C`.
- CoreDevice identifier: `47A4B04F-09CD-5019-B764-AF84C192A668`.
- Connection at verification: wired, connected, paired, Developer Mode enabled.

## Candidate and source identity

- Git HEAD: `6c84950615a0132878e38772007d288ccc381967`.
- Current tracked working-tree diff fingerprint excluding `Evidence/**`: `eac65c88cc2e3a4012d5f302227de23795eebabee420341f50f38f14457f5b11`.
- Settings-localization source/test diff fingerprint (`FriendMVPView.swift`, `FocusPresentationCopy.swift`, `Localizable.xcstrings`, and `FriendMVPReducerTests.swift`): `32aefae5ba18a6d2dc23992859ab1cd0f43345b1d11bcc8bcd33a975c5e42240`.
- Built app: `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-SettingsLocalizationDevice-20260824/Build/Products/Debug-iphoneos/DisciplinedPet.app`.
- Build configuration: `Debug`, fresh DerivedData directory `DisciplinedPet-SettingsLocalizationDevice-20260824`.
- Bundle identifier: `com.cczij.disciplinedpet`; version/build: `0.6.0 (10)`.
- App directory mtime: `2026-08-24 16:09:14 +0800`.
- Executable SHA-256: `a884e3253bc17ec64157d1418c4e1df66a7d609c01b77104a39f9a9fef12b673`.

## Test evidence reused after consistency check

- Existing result bundle: `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-SettingsLocalizationFixRetry-20260824/Logs/Test/Test-DisciplinedPet-2026.08.24_14-21-09-+0800.xcresult`.
- `xcresulttool` result: `totalTestCount: 96`, `failedTests: 0`, `skippedTests: 0`, `result: Passed`.
- The result bundle completed at `2026-08-24 14:23:39 +0800`; the four Settings-localization source/test files above were last modified no later than `14:20:59 +0800`. Their current diff fingerprint is recorded above. Therefore this report reuses the 96/96 result as corresponding-source evidence; it is not a new test run.

## Fresh physical build, install, and launch

- Build: `PASS` — `xcodebuild build` exited `0` against the verified physical destination and the fresh DerivedData directory.
- Install: `PASS` — `devicectl device install app` exited `0` for `com.cczij.disciplinedpet`; it returned a new installation URL under the device app container.
- Launch: `PASS` — `devicectl device process launch` exited `0`.
- Process verification: `PASS` for process presence only — subsequent device process listing showed PID `39617` running the newly installed app container path and PID `39616` for its Live Activity extension.
- Disk: 12 GiB available after the build/install, above the 10 GiB stop threshold.

## Human review checklist

On the physical device, manually switch the app interface language and verify:

1. English and Chinese `Settings` / `Close` labels;
2. companion-dependent shared-record title for both Milo and Max;
3. English duration displays including `120 min`;
4. permission-status labels use the selected app language;
5. the entire `On-device data` / `本机数据` section is absent from production Settings.

## Logs

- `SETTINGS_LOCALIZATION_DEVICE_BUILD.log`
- `SETTINGS_LOCALIZATION_DEVICE_CANDIDATE.log`
- `SETTINGS_LOCALIZATION_DEVICE_INSTALL.log`
- `SETTINGS_LOCALIZATION_DEVICE_LAUNCH.log`

## Status

`SETTINGS_LOCALIZATION_DEVICE_REVIEW_REQUIRED`

Evidence labels:

```text
Implementation: DONE (pre-existing candidate; not independently reimplemented here)
Build: PASS
Tests: PASS (reused corresponding-source 96/96 xcresult)
Simulator: N/A
Device: PASS (build/install/launch/process presence only)
User Evidence: NOT TESTED
UI Localization Review: HUMAN REVIEW REQUIRED
```

---

## Dynamic Settings-value follow-up — 2026-08-24

### New candidate

- Source HEAD: `6c84950615a0132878e38772007d288ccc381967`.
- Source diff fingerprint excluding `Evidence/**`: `1a2f527e095a2a4fa0fc0cd08ef6e5b37817d97f8058c7c7c402d913c43c0a53`.
- Settings-localization source/test diff fingerprint: `d3603323bfbc382ccb84ca4cba648da47af898b1d4ede47ca2b719fc1a164c13`.
- Fresh Debug app: `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-SettingsDynamicLocalization-20260824/Build/Products/Debug-iphoneos/DisciplinedPet.app`.
- Bundle/version/build: `com.cczij.disciplinedpet`, `0.6.0 (10)`.
- Executable SHA-256: `3fe36619760bbe41c131cdb467292f7d2ce9bc1422c294489c894d27564b85ca`.

### Fresh verification and install

- Full CoreTests: `PASS` — 97 total, 0 failed, 0 skipped; result bundle `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-SettingsDynamicLocalization-20260824/Results/SettingsDynamicLocalizationCoreTests-Retry.xcresult`.
- Physical Debug build: `PASS` — `BUILD_EXIT=0`.
- Non-destructive overwrite install: `PASS` — `INSTALL_EXIT=0`; `devicectl` then reports `Focumi` `0.6.0 (10)` installed. No uninstall or data-clear command was issued.
- Launch: `BLOCKED` — two normal `devicectl` launch attempts were rejected by iOS because the physical device was locked. No unlock bypass was attempted.
- Disk after the task: 13 GiB available, above the 10 GiB stop threshold.

### Required human check after unlocking

Open Settings in English and confirm the dynamic values read exactly `Just met` and `Deep Blue`. Then switch to Chinese and confirm the same values read `初次相识` and `深蓝`. The screenshot-confirmed Settings/Close, 0 min, 120 min, and hidden On-device-data behavior were intentionally not changed.

### Follow-up logs

- `SETTINGS_DYNAMIC_LOCALIZATION_CORETESTS.log`
- `SETTINGS_DYNAMIC_LOCALIZATION_DEVICE_BUILD.log`
- `SETTINGS_DYNAMIC_LOCALIZATION_DEVICE_CANDIDATE.log`
- `SETTINGS_DYNAMIC_LOCALIZATION_DEVICE_INSTALL.log`
- `SETTINGS_DYNAMIC_LOCALIZATION_DEVICE_LAUNCH.log`

### Status

`FAIL` — installation completed, but the required normal launch could not be completed while the physical device was locked. UI values remain `HUMAN REVIEW REQUIRED`.

---

## Settings release scope candidate — 2026-08-24

- Scope: Settings presentation only. Formal Settings now has exactly Companion, Language, Focus music, and Permissions & status sections; relationship/statistics/shared-history/default-duration/technical UI is hidden.
- Source HEAD: `6c84950615a0132878e38772007d288ccc381967`; settings-scope source/test diff fingerprint: `5a30e15c5bc0a273bc752d9d5fc16b88b05e7677e1c1dd47b34f051c13043165`.
- Candidate: `com.cczij.disciplinedpet` `0.6.0 (10)` from `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-SettingsReleaseScope-20260824/Build/Products/Debug-iphoneos/DisciplinedPet.app`.
- Executable SHA-256: `e5326e48ffe83afe5210ba8a259563ef97d069b8b701d5c599bfe92b0fe30113`.
- Full CoreTests: `PASS` — 97 total, 0 failed, 0 skipped. Simulator and physical Debug builds: `PASS`.
- Install: `PASS` — non-destructive overwrite, `INSTALL_EXIT=0`; no data-clear or uninstall command was issued.
- Launch: `PASS` — `LAUNCH_EXIT=0`; a subsequent process snapshot showed the new app container process and its Live Activity extension running.
- UI and VoiceOver runtime behavior remain human review only; no hierarchy interaction session was available.

This section supersedes the prior dynamic-localization candidate status for the currently installed Settings candidate:

`SETTINGS_RELEASE_SCOPE_DEVICE_REVIEW_REQUIRED`
