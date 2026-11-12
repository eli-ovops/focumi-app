# Focumi v0.6 — Checkpoint A visual QA

Status: **local candidate; `WAITING_USER_CHECKPOINT_A_REVIEW`**. This document supersedes the earlier Toto-oriented local capture list. Those prior captures remain historical evidence only and are not used to support this Checkpoint A result.

## Scope and truth boundary

- Formal runtime presentation is now **Milo** for persisted `.cat` and **Max** (black-and-white husky puppy) for persisted `.dog`. Persisted identifiers and the session, deadline, Family Controls, ManagedSettings, temporary-access, return/relock reducer, and Live Activity business projections were not changed.
- This checkpoint uses approved static `FocumiMilo*` / `FocumiMax*` poses in an editorial paper stage. A static pose, the completion stamp, haptics, or a transition never claims that iPhone has confirmed a restriction or re-lock.
- App, Live Activity and Shield asset targets remain separated. An extension build or simulator image is not proof of a real Shield, Dynamic Island, or Lock Screen result.

## Local verification evidence

- `xcodebuild test -project DisciplinedPet.xcodeproj -scheme DisciplinedPet -destination 'platform=iOS Simulator,id=C830463B-7F81-444F-B0E8-3E53B655791E' -derivedDataPath .codex-derived-data-v04 -resultBundlePath .codex-derived-data-v04/v06-existing-pets-final-coretests-recheck.xcresult` exited `0`: **66 tests in 6 suites passed**.
- Result bundle: `/Users/USER/Documents/app/自律宠物-iOS/.codex-derived-data-v04/v06-existing-pets-final-coretests-recheck.xcresult`.
- Log: `/Users/USER/Documents/app/自律宠物-iOS/.codex-derived-data-v04/v06-existing-pets-final-coretests-recheck.log`.
- The test target builds the app and Monitor, Shield Configuration, Shield Action, and Live Activity extensions in one six-target dependency graph. The last standalone all-target build is `/Users/USER/Documents/app/自律宠物-iOS/.codex-derived-data-v04/v06-existing-pets-build.log` (`BUILD SUCCEEDED`).
- Static checks: `jq empty DisciplinedPet/Resources/Localizable.xcstrings` passed; a scoped runtime-source search of App, Live Activity, Shield Configuration, Shared, and CoreTests returned no `Toto`, `Pomeranian`, or `FocumiToto` route.

## Screenshot review matrix

All current-task captures are written beneath:

`/Users/USER/Documents/app/自律宠物-iOS/.codex-derived-data-v04/qa-v06-existing-pets-checkpoint-a/screens/final/verified/`

| Surface | Expected local review | Evidence | Status |
| --- | --- | --- | --- |
| Onboarding / claim | Original Milo and Max, paper hierarchy, safe top, no Toto/Pomeranian/Husky hoodie | `01-onboarding-milo-max-zh.png` | PASS (local visual) |
| Pact / ready | Goal, duration, compact truthful setup fact and one reachable CTA; no opaque white card wall | `02-pact-ready-milo-zh.png` | PASS (standard text) |
| Pact / needs-apps | Same layout, original Max and no false readiness | `03-pact-needs-apps-max-zh.png` | PASS (standard text) |
| Start landing / Focus | Native goal/time/truth before decorative pose; approved Max focus pose on a paper stage | `04-focus-max-zh.png` | PASS (local visual) |
| Waiting / Detour | Bookmark/held-page semantics without a protection-success statement | `05-waiting-milo-zh.png` | PASS (local visual) |
| Return | Same goal/time, honest re-request copy, approved Max Return pose, page reopening composition | `06-return-max-zh.png` | PASS (local visual) |
| Completion | Static paper/stamp feedback only; no points, XP, currency, or confirmed protection | `07-completion-milo-zh.png` | PASS (local visual) |
| Settings | Same paper and stitched-section language; original Max presentation | `08-settings-max-zh.png` | PASS (local visual) |
| English | Dynamic companion name resolves to Milo in native text | `09-focus-milo-en.png`, `10-return-milo-en-static.png` | PASS (local visual) |
| AXXXL | Initial page has no bitmap/text clipping, but the DEBUG-only `--friend-mvp-preview-scroll=bottom` anchor did not move the simulator scroll view; CTA-at-bottom traversal is unproven | `11-pact-max-axxxl-top.png`, `12-pact-max-axxxl-bottom.png`, `13-pact-max-axxxl-bottom-delayed.png` | **GAP — not PASS** |
| Reduce Motion | Static endpoint projection is covered by test; an independently toggled simulator setting and hierarchy reading remain unavailable | No reliable runtime setting capture | Partial |

## System-surface boundary

- Live Activity / Dynamic Island: resource and state mappings are build/test verified for focusing, waiting, and returning. Compact Island, expanded Island, Lock Screen and expiry cleanup need system preview or real-device observation.
- Shield: `FocumiMiloShieldPortrait` and `FocumiMaxShieldPortrait` are build/test verified mappings only. Apple-owned Shield layout and real temporary-access/re-lock remain device gates.
- VoiceOver hierarchy, real Reduce Motion, AXXXL traversal and real FamilyActivityPicker cannot be inferred from a successful local build; any missing screenshot/hierarchy stays marked as a gap. The AXXXL debug-anchor non-result above is a local implementation/testability concern to resolve before calling the accessibility matrix complete.

## Visual acceptance criteria for this checkpoint

1. The viewport reads as a single aged-paper editorial page: thin stitched/page dividers and a limited tab/bookmark accent, not nested white-card walls or rectangular pet posters.
2. Decorative layers are accessibility-hidden and never obscure the goal, timer, truthful state, or the one main CTA.
3. Max and Milo are visually distinct and occupy a grounded oval/page stage rather than a full-width opaque image block.
4. No runtime source, preview copy, localized display string, or VoiceOver label routes a dog to Toto/Pomeranian or to legacy 3D hoodie art.

## Disk hygiene

This task writes only task-scoped logs/result bundles under `.codex-derived-data-v04`, screenshot evidence under the path above, and a small isolated Return draft under `Design/CheckpointA_ReturnAnimatic_Draft_2026-08-13`. No archive is made and no prior evidence, approved master, source asset, cache, or user data is deleted.
