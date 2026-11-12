# Authorized cleanup manifest — 2026-08-24

## Preconditions

- Free disk before cleanup: `4.0 GiB` (98% used).
- Confirmed no active `xcodebuild test`, `archive`, or `exportArchive` process for DisciplinedPet.
- All listed targets were checked as directories (not symlinks), resolve to the same absolute path, and are Xcode DerivedData only.
- Excluded: project/workspace/source, `.git`, lockfiles, Docs, Design, Evidence, all approval assets, databases, credentials/profiles/keys, build-10 archive `/Users/USER/Library/Developer/Xcode/Archives/2026-08-24/DisciplinedPet-0.6.0-10.xcarchive`, and build-10 IPA `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-AppStoreUpload-20260824/Export-AppStoreConnect/DisciplinedPet.ipa`.

## Exact deletion list

| Absolute real path | Type | Size before | Mtime | Source / purpose |
| --- | --- | ---: | --- | --- |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-AppStoreUpload-B11-20260824` | Directory | 502056 KiB | 2026-08-24T20:29:07+0800 | This task's two incomplete build-11 test attempts. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-PhysicalInstallReleasePreflight-20260824` | Directory | 991224 KiB | 2026-08-24T13:53:45+0800 | Prior Focumi physical-install preflight DerivedData; rebuildable. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-SettingsDynamicLocalization-20260824` | Directory | 689140 KiB | 2026-08-24T16:21:46+0800 | Prior Settings localization test/build DerivedData; rebuildable. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-SettingsReleaseScope-20260824` | Directory | 673128 KiB | 2026-08-24T17:02:03+0800 | Prior Settings release-scope DerivedData; rebuildable. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-SettingsLocalizationFixRetry-20260824` | Directory | 692504 KiB | 2026-08-24T16:03:31+0800 | Prior Settings localization retry DerivedData; rebuildable. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-SettingsLocalizationDevice-20260824` | Directory | 335428 KiB | 2026-08-24T16:08:30+0800 | Prior Settings device-build DerivedData; rebuildable. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-SettingsLocalizationFix-20260824` | Directory | 260660 KiB | 2026-08-24T14:06:30+0800 | Prior Settings localization DerivedData; rebuildable. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-aqvynesktfbtriahwmvnndfekcot` | Directory | 108 KiB | 2026-08-24T13:50:22+0800 | Xcode's default DerivedData for this project; rebuildable. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-AppStoreUpload-20260824/Build` | Directory | 301208 KiB | 2026-08-24T20:05:34+0800 | Build-10 temporary compile products; IPA/archive excluded. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-AppStoreUpload-20260824/CompilationCache.noindex` | Directory | 28 KiB | 2026-08-24T20:05:34+0800 | Rebuildable compile cache. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-AppStoreUpload-20260824/Index.noindex` | Directory | 31688 KiB | 2026-08-24T20:05:37+0800 | Rebuildable Xcode index. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-AppStoreUpload-20260824/Logs` | Directory | 256 KiB | 2026-08-24T20:05:30+0800 | Build-temporary logs; durable evidence is under project Evidence. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-AppStoreUpload-20260824/ModuleCache.noindex` | Directory | 275420 KiB | 2026-08-24T20:08:35+0800 | Rebuildable compiler cache. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-AppStoreUpload-20260824/Results` | Directory | 11112 KiB | 2026-08-24T20:06:24+0800 | Build-temporary test bundles; summary retained in project Evidence. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-AppStoreUpload-20260824/SDKStatCaches.noindex` | Directory | 2964 KiB | 2026-08-24T20:08:27+0800 | Rebuildable SDK stat cache. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-AppStoreUpload-20260824/TestResults` | Directory | 16 KiB | 2026-08-24T20:07:40+0800 | Build-temporary test data. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-AppStoreUpload-20260824/info.plist` | Regular File | 4 KiB | 2026-08-24T20:08:24+0800 | Rebuildable DerivedData metadata. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-AppStoreUpload-20260824/Export-AppStoreConnect/DistributionSummary.plist` | Regular File | 8 KiB | 2026-08-24T20:12:12+0800 | Export-temporary summary; IPA excluded. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-AppStoreUpload-20260824/Export-AppStoreConnect/ExportOptions.plist` | Regular File | 4 KiB | 2026-08-24T20:12:12+0800 | Export-temporary generated options; IPA excluded. |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-AppStoreUpload-20260824/Export-AppStoreConnect/Packaging.log` | Regular File | 60 KiB | 2026-08-24T20:12:12+0800 | Export-temporary log; IPA excluded. |

The exact paths above are the only deletion targets. Post-delete absence and free-space results will be appended below.

## Result

- Every exact path in the deletion list was confirmed `ABSENT` after deletion.
- Protected build-10 archive and IPA were independently confirmed `PRESENT`.
- Free disk changed from `4.0 GiB` to `5.9 GiB` (an observed increase of `1.9 GiB`). The discrepancy from apparent-directory sizes is retained as an environment/filesystem accounting observation; no broader cleanup was attempted.
- Because free disk remains below the authorized `10 GiB` hard stop (and far below the `>15 GiB` target), no build-11 test rerun, archive, export, or upload was started after cleanup.

## Authorized follow-up cleanup

- Revalidated and deleted only `/Users/USER/Documents/app/自律宠物-iOS/.build/DerivedData-ios17-audit` and `/Users/USER/Documents/app/自律宠物-iOS/.build/DerivedData-release-dir4`.
- Each resolved to itself, was a non-symlink directory beneath the project `.build` directory, and had no active Xcode test/archive/export user before deletion.
- Both exact paths were confirmed `ABSENT` afterward.
- Protected build-10 archive and IPA were reconfirmed `PRESENT` afterward.
- Free disk changed from `5.2 GiB` to `6.5 GiB`, an observed increase of `1.3 GiB`.
- This remains below the authorized `10 GiB` continuation threshold. No further inventory, deletion, build, archive, export, or upload action occurred.
