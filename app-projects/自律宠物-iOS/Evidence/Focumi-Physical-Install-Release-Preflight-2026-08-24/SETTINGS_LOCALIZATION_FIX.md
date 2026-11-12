# Settings localization fix — 2026-08-24

## Candidate and scope

- Candidate HEAD: `6c84950615a0132878e38772007d288ccc381967`.
- This repository was already dirty before this repair. Existing user changes were preserved.
- Allowed implementation areas changed in this repair: Settings presentation copy, String Catalog entries, and directly related reducer tests. No version/build, signing, entitlement, App Icon, approved asset, Family Controls, Shield, session, or user-data logic was changed.

## Root cause and repair

`FriendSettingsView` mixed the app-injected locale with ambient localization and values built from Chinese source strings. This allowed the setting selection to update some UI while toolbar labels, status values, music names, relationship labels, and formatted durations still resolved in the system locale or from Chinese source text.

The repair makes Settings use the existing `FocumiInterfaceLanguage` locale boundary and a single `FocumiSettingsCopy` resolver for every visible Settings label/value. It also:

- resolves the shared-record title from the current companion (`Milo` or `Max`) rather than the archived memory's stale name;
- uses `min` for every English compact duration, including `120 min`; Chinese remains `分钟` and `2 小时`;
- removes `.localData` from the production Settings item list and removes the entire on-device-data group from `FriendSettingsView`; `clearAllLocalData()` and its underlying data logic remain intact and are not moved into another production user entry point;
- adds the Chinese catalog entries required for `Close`, `Disabled`, `Music`, shared-record formatting, and music track names.

## Fresh verification

### CoreTests

Fresh command (no code signing):

```text
xcodebuild test -quiet -project DisciplinedPet.xcodeproj -scheme DisciplinedPet -destination 'platform=iOS Simulator,id=28E93BBF-042B-4E49-8D5C-706E22A09B0C' -derivedDataPath /Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-SettingsLocalizationFixRetry-20260824 CODE_SIGNING_ALLOWED=NO
```

Result: passed. The final xcresult summary reports `totalTestCount: 96`, `failedTests: 0`, `skippedTests: 0`, and `result: Passed`.

Result bundle:

```text
/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-SettingsLocalizationFixRetry-20260824/Logs/Test/Test-DisciplinedPet-2026.08.24_14-21-09-+0800.xcresult
```

The regression coverage includes English/Chinese Settings copy, toolbar `Settings`/`Close`, Milo/Max shared-record copy, English `120 min`, Chinese `2 小时`, and the production Settings item list excluding local data and technical diagnostics.

### Static checks

- `Localizable.xcstrings` parsed successfully with `jq empty`.
- The `FriendSettingsView` production range contains no `On-device data`, `本机数据`, `Clear on-device data`, `Version`, `版本`, or technical-diagnostics UI labels.
- Disk at final gate: 15 GiB available on `/System/Volumes/Data`, above the 10 GiB stop threshold.

## Simulator/physical-device gate — blocked

No Settings-page screenshots were produced, and no physical-device build/install was attempted. The requested workflow requires two visual Settings screenshots before device installation.

The app has accessibility identifiers for `focumi.settings`, `focumi.settings.language`, and `focumi.settings.close`, but it has no existing DEBUG/launch argument that opens Settings directly. The available native `simctl ui` command only controls appearance, contrast, and content size; it cannot tap controls or read an accessibility hierarchy. The required DeviceInteraction session/event APIs are not available in this execution environment. Adding a new Settings launch fixture, using guessed coordinates, or presenting unrelated screenshots would exceed the authorized verification boundary.

Consequently, visual Simulator verification and the dependent physical iPhone install are **not passed**. This evidence records the first blocking point rather than treating CoreTests as a substitute for UI evidence.

## Status

`FAIL` — first blocking point: no available safe mechanism to open the Settings sheet and capture the required English and Chinese Simulator visual screenshots; physical installation is intentionally not attempted.

---

## Dynamic Settings-value follow-up — 2026-08-24

### User-observed defect and scoped repair

- A real-device English Settings screenshot showed the two dynamic values `初次相识` and `深蓝` while the surrounding Settings copy was already English.
- `FriendSettingsView` now resolves both `CompanionRelationshipStage` and `FocusMusicTrack` through `FocumiSettingsCopy`, the same app-locale boundary used by the other Settings copy.
- The mapping covers every current relationship stage and music track. English `firstHello` is `Just met`; its Simplified Chinese mapping is `初次相识`. Existing music mappings include English `Deep Blue` and Simplified Chinese `深蓝`.
- No business state, persisted enum raw value, session, Family Controls behavior, version/build, signing, entitlement, App Icon, or user data handling was changed.

### Fresh automated verification

- Full `DisciplinedPetCoreTests` command completed successfully after the fix: `totalTestCount: 97`, `failedTests: 0`, `skippedTests: 0`, `result: Passed`.
- Result bundle: `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-SettingsDynamicLocalization-20260824/Results/SettingsDynamicLocalizationCoreTests-Retry.xcresult`.
- The added test enumerates all five `CompanionRelationshipStage` cases and all three `FocusMusicTrack` cases in English and Simplified Chinese, and asserts that the test table equals the actual `allCases` lists.
- The initial test attempt failed only at compile time because the new pure mapping properties needed `nonisolated`; the retry above is the sole passing test result used for this candidate.

### Candidate source identity

- HEAD: `6c84950615a0132878e38772007d288ccc381967`.
- Current tracked diff fingerprint excluding `Evidence/**`: `1a2f527e095a2a4fa0fc0cd08ef6e5b37817d97f8058c7c7c402d913c43c0a53`.
- Settings-localization source/test diff fingerprint: `d3603323bfbc382ccb84ca4cba648da47af898b1d4ede47ca2b719fc1a164c13`.

### Remaining manual boundary

The runtime display of `Just met` and `Deep Blue` remains subject to physical-device human review. Prior screenshot-confirmed items (Settings/Close, labels, `0 min`, `120 min`, and the hidden On-device-data section) were not reverted or changed by this follow-up.
