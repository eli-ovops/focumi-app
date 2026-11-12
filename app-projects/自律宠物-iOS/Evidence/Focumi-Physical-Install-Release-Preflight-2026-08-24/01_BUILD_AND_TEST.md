# Build and test record

Candidate: `6c84950615a0132878e38772007d288ccc381967` with the dirty-worktree fingerprint recorded in `00_CANDIDATE_MANIFEST.json`.

## Fresh test

- Command: `xcodebuild test` for scheme `DisciplinedPet`, destination `Focumi-MiloFreeSwitch-QA-20260824` (iPhone 17 Simulator, iOS 27), with the unique DerivedData directory recorded in the manifest.
- Result bundle: `DisciplinedPetCoreTests.xcresult`.
- `xcresulttool` summary: **Passed**; 95 tests passed; 0 failed; 0 skipped; 0 expected failures.

## Physical-device builds

- Debug build for `platform=iOS,id=00008150-0001095A360A401C`: **BUILD SUCCEEDED**.
- Release build for the same destination: **BUILD SUCCEEDED**. Xcode ran its local embedded-bundle validation; this is not App Store Connect validation or submission.
- Built app identity: `com.cczij.disciplinedpet`, `0.6.0 (10)`.

## Disk gate

- Before the fresh build: 22,984,572 KiB available.
- After tests, builds, install evidence and audit: 21,964,596 KiB available (about 20.9 GiB).
- The unique DerivedData directory is about 971 MiB. No cleanup was performed.

## Scope confirmation

No source, asset, version, signing, entitlement, device-data, App Store Connect, TestFlight, upload, submission, or release change was made by this task.
