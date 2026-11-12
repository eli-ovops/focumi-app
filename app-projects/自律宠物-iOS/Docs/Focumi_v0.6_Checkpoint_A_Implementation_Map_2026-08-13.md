# Focumi v0.6 — Checkpoint A implementation map

Status: **implementation in progress; stop gate is `WAITING_USER_CHECKPOINT_A_REVIEW`**.

## Frozen input and smallest sufficient architecture

- Execution PRD SHA-256 verified on 2026-08-13: `5b7032cd6e98a158e8961cfead67597167b2eaab86ceeffc8dc65202b9d82021`.
- The existing-pet audit is the asset authority: Milo is the orange tabby with a sage scarf; Max is the black-and-white husky puppy with a dusty-blue plaid scarf.
- Persisted `.cat` / `.dog` remain untouched. A presentation-only map turns `.dog` into **Max** and routes only to `FocumiMax*` candidates.
- Stable truth is out of scope: `FriendMVPDomain`, reducer/session deadline, model effects, Family Controls, ManagedSettings, temporary access, return/relock, and ActivityKit lifecycle.

## First-principles and red-team checks

| Risk | Local block |
| --- | --- |
| Renaming a redesign as recovery | Identity test and runtime search require `.dog → Max`, `FocumiMax*`, and no Toto/Pomeranian route. |
| Static swaps presented as character animation | A uses approved static poses only. Return materials live outside runtime and are explicitly labelled draft, not a passing clip. |
| Presentation claims a system result | All text remains derived from business projection; cue completion has no reducer/effect callback. |
| Page world becomes a card/poster collection | Reusable paper sections use dividers, tabs and stage washes rather than nested rounded character tiles. |
| Build stands in for device-system truth | Widget/Shield build and previews are local evidence only; device Shield/Island/relock remain separate. |

## Change map

| Layer | Files / responsibility | Constraint |
| --- | --- | --- |
| Presentation projection | `CompanionPerformanceState.swift`, `FriendMVPView.swift` | Observed phase can permit a deduplicated visual cue; it cannot dispatch domain events or assert success. |
| Identity compatibility | `CompanionPresentation.swift`, `PetAvatarView.swift`, copy callers | `.dog` is a stable persistence ID; every user-visible name and formal route is **Max**. |
| Continuous storybook UI | `FriendMVPView.swift` | Native text, timer, CTA and truth precede a single static companion stage; paper, stitch, tab and stamp decoration are hidden from accessibility. |
| System mapping | `Shared/FocusLiveActivityAttributes.swift`, `Shared/AppGroupKeys.swift`, widget / Shield renderers | App, Live Activity and Shield use separate `FocumiMilo*` / `FocumiMax*` targets; returning remains requesting/neutral. |
| Verification | `DisciplinedPetCoreTests`, simulator evidence | Tests cover no-migration Max projection, formal resource maps, cue idempotency, Reduce Motion landing and truth copy. |

## Reuse decision

Apple SwiftUI, ActivityKit and FamilyControls remain the implementation. Apple’s Live Activity documentation supports the current native ActivityKit surface; Lottie-iOS (Apache-2.0) and Rive-iOS (MIT) were reviewed but rejected for A: both require a new vector animation/runtime pipeline while the approved assets are raster static poses and no formal clip is yet valid. No third-party runtime, code or visual asset is added.

## Checkpoint-A exit boundary

Build/test and simulator evidence may establish a local candidate only. Physical Shield, Live Activity, Dynamic Island, Family Controls, VoiceOver runtime behaviour and device rendering remain unasserted gates. Checkpoint B may not begin before user review.
