# Remaining Focumi-only disk inventory — 2026-08-24

Read-only inventory. No deletion, move, archive, or write outside this evidence file occurred.

## Scope and exclusions

- Scanned only `/Users/USER/Documents/app/自律宠物-iOS` build-related paths (with `.git`, Docs, Design, and Evidence pruned) plus known DisciplinedPet Xcode DerivedData and the known build-10 archive.
- Did not scan the home directory generally, `/tmp`, other projects, or system caches.
- Excluded source, `.git`, Docs, Design, Evidence, approved assets, user documents, databases, signing materials, profiles, and secrets.
- Free disk observed during scan: `5.2 GiB` (98% used).

## >100 MB deletion candidates

| Absolute path | Realpath | Type / symlink | Size | Mtime | Source / purpose | Dependencies | Rebuildable | Risk | Recommendation |
| --- | --- | --- | ---: | --- | --- | --- | --- | --- | --- |
| `/Users/USER/Documents/app/自律宠物-iOS/.build/DerivedData-ios17-audit` | same path | Directory / no | 870020 KiB | 2026-08-19T08:56:19+0800 | Xcode DerivedData from the named iOS 17 audit; project `.gitignore` excludes `.build/`. Existing evidence describes this path as regenerable cache. | Xcode/project source; no runtime dependency found. | Yes | Removes local build/index/log cache; durable Evidence remains separate. | `DELETE_CANDIDATE` |
| `/Users/USER/Documents/app/自律宠物-iOS/.build/DerivedData-release-dir4` | same path | Directory / no | 489816 KiB | 2026-08-18T10:56:08+0800 | Xcode DerivedData from the named release-dir4 build; project `.gitignore` excludes `.build/`. | Xcode/project source; no current evidence reference found. | Yes | Removes local build/index/log cache; must rebuild for reuse. | `DELETE_CANDIDATE` |

Candidate total: `1,359,836 KiB` (about `1.30 GiB`). Even if both are deleted, observed free space would be approximately `6.5 GiB`, not the requested `>=15 GiB`.

## Protected current artifacts

| Absolute path | Realpath | Type / symlink | Size | Mtime | Reason | Recommendation |
| --- | --- | --- | ---: | --- | --- | --- |
| `/Users/USER/Library/Developer/Xcode/DerivedData/DisciplinedPet-AppStoreUpload-20260824/Export-AppStoreConnect/DisciplinedPet.ipa` | same path | Regular File / no | 59820 KiB | 2026-08-24T20:12:12+0800 | Current build-10 IPA explicitly protected by authorization. | `KEEP` |
| `/Users/USER/Library/Developer/Xcode/Archives/2026-08-24/DisciplinedPet-0.6.0-10.xcarchive` | same path | Directory / no | 79064 KiB | 2026-08-24T20:08:49+0800 | Current build-10 archive explicitly protected by authorization. | `KEEP` |

## Below-threshold observed build directory

- `/Users/USER/Documents/app/自律宠物-iOS/build`: 58368 KiB, regular project build output, Git-ignored. It is below the requested >100 MB reporting threshold and was not promoted to a candidate.

## Conclusion

No Focumi-only, scope-authorized candidate set can restore free disk to 15 GiB. No cleanup recommendation beyond the two explicit candidates is made.
