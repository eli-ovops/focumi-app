# Focumi Current Architecture & Documentation Audit — 2026-08-14

> **Status:** 待主总控验收。严格只读源码/工程审计后，仅重构授权 Markdown；未运行 build/test，未修改 Swift、工程、配置、资源、签名、数据库或外部系统。

## 1. 唯一 Repository 确认

**Confirmed repository:** `/Users/USER/Documents/app/自律宠物-iOS`

交叉依据：

1. `DisciplinedPet.xcodeproj` 和同名 workspace 位于根目录；
2. `project.yml` 声明 `DisciplinedPet`、bundle prefix `com.cczij`、`0.5.0 (7)`、主 App 与五个附属 Target（四 Extension + CoreTests）；
3. `project.pbxproj` 具 `DisciplinedPet`、Monitor、Shield Configuration、Shield Action、Live Activity、CoreTests 的 native targets/bundle IDs；
4. `DisciplinedPet/`、`Shared/` 和 Extension 源码直接实现 Family Controls/Managed Settings/Device Activity/ActivityKit 与 Focumi/Milo/Max 呈现；
5. 项目 `AGENTS.md`、`Docs/` 中的 PRD/架构/P0/Beta/v0.4/v0.6 材料都指向此路径和产品；
6. `Evidence/P0-A-real-device-2026-08-10/README.md` 在本仓库内记录限定 P0-A 的真机边界。

没有第二个候选同时满足上述六类证据，故已开始限定 Markdown 写入。

## 2. 范围与证据限制

- 已读：上级与项目 `AGENTS.md`、附带任务单、当前源/Target/关键配置、历史 PRD/架构/实施/Checkpoint/证据索引。
- 排除：`.git`、构建/DerivedData、Pods、node_modules、ReviewPackages 快照、潜在秘密文件内容；没有读取 `.env`/凭据/私钥。
- 事实优先级：当前源码/工程配置 > 可验证 Target/entitlement/persistence > 当前有日期 PRD/ADR 等 > 其他文档 > 历史说明 > 推断。
- `CURRENT` 不表示 Build、Simulator、Device、用户/支付验收。以下 Device 历史记录只按其限定范围引用。

## 3. Authority map

| Concern | 当前入口 | Confidence | Conflict / boundary |
| --- | --- | --- | --- |
| Product | `Docs/PROJECT.md`; historical PRDs retained | Medium | v0.1.5/v0.3/v0.4/v0.6 有不同时期目标，不能同时当当前版本规格 |
| Architecture | `Docs/ARCHITECTURE.md` + source/config | High | v1.1 写计划工程/旧 P0 topology，与当前 Target 不同 |
| State | `Docs/STATE_MACHINES.md` + reducers/models | High | old specs are not current transition truth |
| Platform | `Docs/PLATFORM.md` + config/targets | High for existence; low for device behavior | source/config ≠ Apple runtime behavior |
| Engineering | `Docs/ENGINEERING.md` + scheme/project.yml | High | historical commands/results do not certify future revisions |
| Testing | CoreTests source + `ENGINEERING.md` | High for test presence | this audit did not execute tests |
| Acceptance | `Evidence/README.md`, P0-A record, dated Checkpoint QA | Medium | separate Build/Simulator/Device/User evidence; no universal acceptance document |
| Current implementation status | source/config and this audit | High | build/version is not release or product validation |

`AUTHORITY CONFLICT`: legacy project `AGENTS.md` and `Docs/README.md` still presented P0/Beta v0.2 documents as the present baseline while current code/config contains v0.4/v0.6 paths and a Live Activity target. They are preserved and reclassified through new entry documents; historical files were not rewritten.

## 4. Current architecture verdict

The repository is a compact, native SwiftUI application with two explicit reducer-driven state domains, direct initializer injection and thin Apple-API clients. It is not over-engineered; the highest continuation risk is **documentation drift plus a concentrated Feature/UI seam**, rather than a missing framework.

- `FriendMVPModel` + `FriendMVPReducer` own the visible focus lifecycle and local data.
- `P0CapabilityModel` + `P0CapabilityReducer` own authorization/selection/local protection command coordination.
- Shared App Group DTOs bridge independent extensions; a command receipt is explicitly local evidence.
- `FriendMVPView.swift` aggregates root routing, multiple screens and visual presentation in 3,287 lines; this raises localized change/navigation cost but is not itself a P0 defect.
- Current project has six targets total: app, Monitor, Shield Configuration, Shield Action, Live Activity, CoreTests.

## 5. Architecture drift and top problems

| Priority | Finding | Source evidence | Why it matters |
| --- | --- | --- | --- |
| P1 | Correlated focus and protection lifecycles are split | `FriendMVPModel` drives `P0CapabilityModel`; reducers have independent phases; intent routing joins them | changes can regress a boundary without either reducer alone showing the full contract |
| P1 | Documentation/topology drift | old AGENTS/v1.1 describe P0/no Live Activity/plan state; current `project.yml` has Live Activity and `0.5.0 (7)` | agents can edit wrong docs, infer wrong target count or repeat broad scans |
| P1 | App Group is a distributed protocol, not a global single writer | main app, Shield Action and Monitor own different keys; `AppGroupStore` has per-key JSON only | key/schema/writer changes can cause cross-process loss or stale state |
| P1 | Background audio intent conflict | config has audio background mode; `FocusAudioClient` documents stopping while inactive | owner/QA cannot know intended system policy from code comments alone |
| P1 | UI aggregation seam | `FriendMVPView.swift` contains root, setup, focus, access, completion, settings, feedback and many local navigation flags | high cognitive/load and regression surface for any screen change |
| P2 | P0 diagnostics is a secondary embedded flow | root app hosts Friend MVP and exposes P0 UI in a sheet | current capability ownership is harder to discover, but no source-proven defect |
| P2 | DEBUG preview flags span view/model/store | guarded preview arguments across three locations | local testability plumbing needs intentional containment to avoid future leakage |

No P0 source-proven SSOT violation, persistence multi-writer for the same business record, cross-feature UI mutation, custom Service Locator, app-owned singleton or NotificationCenter business bus was found. Actual shield state remains system-owned and deliberately not modelled as confirmed local truth.

## 6. AI DEVELOPMENT FRICTION (ranked)

1. **DOCUMENTATION FRICTION — high:** multiple dated files self-identify as baselines; previous index/AGENTS did not locate the current code/config facts.
2. **CONTEXT FRICTION — high:** one large Feature file and two linked models require repeated manual reconstruction of flow ownership.
3. **PLATFORM FRICTION — high:** target/config existence, local command receipt and true device behavior are easy to conflate without a capability/evidence table.
4. **ARCHITECTURE FRICTION — medium:** cross-model focus/protection transitions and App Group ownership are implicit in imperative effect routing.
5. **TEST FRICTION — medium:** reducers/shared protocol have good deterministic coverage, but no single current command/evidence matrix made it clear which outcomes are only Device-verifiable.

## 7. Core-document changes

| File | Action | Purpose |
| --- | --- | --- |
| `AGENTS.md` | rewritten, 83 lines | compact task routing, invariants, scope, DoD and evidence report format |
| `Docs/PROJECT.md` | created | current promise/range/non-goals/status navigation |
| `Docs/ARCHITECTURE.md` | created | repository/dependency/state/DI/persistence/navigation/debt truth |
| `Docs/STATE_MACHINES.md` | created | current core flows, local effects, recovery and recommended normalization |
| `Docs/PLATFORM.md` | created | capability/target/protocol/evidence boundaries |
| `Docs/ENGINEERING.md` | created | owner-first development/test/spike/debt/change contract |
| `Docs/README.md` | minimally rewritten | points to the current documentation entry set and preserves historical roles |

All historical PRD, architecture, implementation, QA, Evidence, Design and ReviewPackages files were preserved unchanged. No HTML was generated.

## 8. First-principles and red-team review

| Item | Result |
| --- | --- |
| Premise | Follow-on agents need a low-context route to source-backed owners without turning historical product decisions into current implementation facts. |
| Attack / misuse | Treat a build or `ManagedSettingsStore` assignment as a real Shield result; use old P0 topology as current; add a new App Group writer; add a third model to “unify” states; silently replace unreadable local state. |
| Blocking evidence | state/Platform docs label command receipt as local-only; target/protocol table lists writers/readers; engineering contract requires explicit change note/device plan; stores retain recovery-required behavior. |
| Residual risk | documents cannot prove current physical-device behavior or force future authors to run relevant tests. The old historical documents remain and may still be opened directly. |
| Closure validation | new AGENTS routes task types to narrow documents; README separates current entry from history; source/config hash manifest compared after write; main controller must review documentation claims against task authority. |

## 9. Forbidden-file baseline and post-write comparison

Baseline captured before Markdown edits using a sorted SHA-256 manifest over **182** current non-document files: all runtime/test `.swift`, `project.pbxproj`, `project.yml`, `Config/*.plist`, `Config/*.entitlements`, `Config/*.xcconfig`, and active Target resource `Contents.json` manifests. Build artifacts, historical snapshots and secret-pattern files were excluded.

```text
baseline manifest SHA-256: 77effef50a8894d5bccecabdc4737ac6e2b09265da0f9a8c53dbb7e0dfb1878f
post-write manifest SHA-256: 77effef50a8894d5bccecabdc4737ac6e2b09265da0f9a8c53dbb7e0dfb1878f (MATCH)
```

Before-write authorized Markdown baseline:

```text
AGENTS.md: e7598899c7ac62268d62a37ce3cbc94fc77eecb9c5c4a1b68ea2233262afe926
Docs/PROJECT.md, ARCHITECTURE.md, STATE_MACHINES.md, PLATFORM.md, ENGINEERING.md: absent
```

The pre-write `AGENTS.md` size/mtime was `11619 bytes` / `2026-08-12T10:13:36+0800`; the five new core documents were absent. The final comparison matches, proving **Source Code Changed: NO** across the documented forbidden manifest.

Git root is `/Users/USER/Documents/app`, not this project directory. At both audit start and end, `git -C /Users/USER/Documents/app/自律宠物-iOS status --short -- .` reported `?? ./` because the project directory is untracked in that parent worktree. No files were staged, committed, branched, reset or cleaned.

## 10. Remaining UNKNOWN / DEVICE REQUIRED

- Current build’s Family Controls/Shield appearance, access clear/relock, monitor schedule/termination timing and App Group propagation.
- Live Activity authorization, Dynamic Island, Lock Screen, expiry cleanup and duplicate handling.
- Notification delivery/late actions; audio interruption/background behavior; VoiceOver/Reduce Motion/Dynamic Type runtime behavior.
- Retention, natural reuse, payment, market demand and release acceptance.

## 11. Recommended next step

Main controller should review this documentation boundary first. The next implementation task, if explicitly authorized, should choose **one** P1 seam: either reconcile background-audio policy or add a small cross-model transition contract/test around the exact focus/protection change. It must not start a broad architecture rewrite or claim device behavior without new device evidence.
