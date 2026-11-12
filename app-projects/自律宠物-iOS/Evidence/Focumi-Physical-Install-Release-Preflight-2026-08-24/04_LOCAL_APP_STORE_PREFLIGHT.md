# Local App Store preflight (read-only)

Scope: local source and freshly built artifacts only. No App Store Connect, TestFlight, account, upload, submission, or remote metadata request was made. Remote status is **NOT TESTED**.

## Findings

| Area | Local result | Release implication |
| --- | --- | --- |
| Version/build | Xcode project resolves to `0.6.0 (10)`; `project.yml` declares `0.6.0 (9)` | **BLOCKER:** resolve the project-generation/source-of-truth drift before a release candidate is created. |
| Targets/bundle IDs | App plus Monitor, Shield Configuration, Shield Action and Live Activity targets built; bundled identifiers match their configured `com.cczij.disciplinedpet.*` values | Local consistency observed. |
| Entitlements | Configured Family Controls and App Group entitlements are present for App/Monitor/Shield Configuration/Shield Action. Fresh Release artifacts include Family Controls for the app and all four extensions. | **BLOCKER / account check required:** distribution authorization/profile and App Review acceptance are not proven by development-device signing. |
| Release signing | The local Release artifact is development-signed (`get-task-allow` is enabled). | **BLOCKER:** not a distributable App Store-signed archive. |
| Permissions | Main Info.plist exposes no `NS*UsageDescription` entries. | No declared privacy prompt found locally; verify actual data/API usage before release. |
| Privacy manifest | No `PrivacyInfo.xcprivacy` found under the app/config source roots. | **BLOCKER until a release owner determines and supplies the required privacy declaration, if applicable.** |
| Privacy policy/support URL/metadata/screenshots/review notes | No local release metadata, privacy-policy, support-URL, screenshot, or review-notes package found in app/config roots. | **BLOCKER / missing local release materials.** |
| Icon/display name/localization | Built app reports display name Focumi; app icon source and `Localizable.xcstrings` plus English/Chinese InfoPlist strings are present. | User visual review still required. |
| Compact duration copy | Fresh passing unit test confirms English 25 / 45 / 60 as `min` and Chinese 45 as `分钟`; that same test explicitly expects 120 as `2 hours`. | **Acceptance gap:** if the required 120-minute compact English label is `120 min`, the current candidate does not meet it. No source change was authorized in this task. |
| Debug-only UI | Relevant fixture/override paths are guarded by `#if DEBUG` (many additionally simulator-only). | Static evidence supports Release hiding; user should still verify the Release candidate UI when one is properly signed. |
| Placeholder scan | No executable user-facing placeholder was established from the focused source scan; matches are localization comments and documentation. | No blocker from this scan alone. |

## Release-build observation

The physical Release build completed successfully. Its local compiler output included the usual destination-selection notice for an unqualified settings query; that query was audit-only. No Release build failure occurred.

## Conclusion

The local candidate is buildable and installable for development, but it is **not release-ready**. The version/build source drift, non-distribution signing, unverified Family Controls distribution eligibility, missing/undetermined privacy manifest, absent local release-metadata materials, and the 120-minute copy acceptance gap require separate authorized work. This audit neither authorizes nor performs that work.
