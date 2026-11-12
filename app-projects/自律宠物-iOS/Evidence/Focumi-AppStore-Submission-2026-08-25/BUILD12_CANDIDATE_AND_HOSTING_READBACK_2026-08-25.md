# Focumi Build 12 candidate and hosting readback — 2026-08-25

## Scope and frozen baseline

- Repository: `/Users/USER/Documents/app/自律宠物-iOS`
- Branch: `codex/v0.6-redesign`
- HEAD: `6c84950615a0132878e38772007d288ccc381967`
- Pre-change dirty-path fingerprint: `c9af0db250ccd39d9217d9ae938f5711ef2c45fa5e5036a228dd8cd8dd586bc1`
- Pre-change binary-diff fingerprint: `65a5dcd277e987b9ed576d15cca38cf624396d87639db35cebfc199d9ccab8a4`
- The project file was already dirty. This run changed only its two
  `CURRENT_PROJECT_VERSION` values from 11 to 12. Marketing version remains
  `0.6.0`; no product code, UI, or approved asset was changed by this run.

## Candidate verification

- CoreTests: PASS — 97 passed, 0 failed, 97 total (isolated result bundle,
  iPhone 17 Pro simulator, iOS 27.0).
- Release archive: succeeded with isolated DerivedData.
- Exported IPA: `/private/tmp/focumi-build12.kRDYMG/Export/DisciplinedPet.ipa`
  (61,252,677 bytes; SHA-256
  `cb196ffb618b2790309968a8a06f4ac92036e7a7e213c6c9b[REDACTED_PHONE]ab59`).
- IPA inspection: main app and the monitor, shield configuration, live activity,
  and shield action extensions all report version `0.6.0` and build `12`.
- Screenshot candidate:
  `Screenshots-B12/Focumi-B12-iPhone17Pro-01.png` (1,206 x 2,622; 877,615
  bytes; SHA-256
  `73460fdc1710c77d97f04d04cde6ebf4b595052b0162f04c5d448639781cc786`).
  It was captured from the same source/version settings on an iPhone 17 Pro
  simulator. Manual visual review found no debug UI, personal data, or
  placeholders; Milo and Max are intentional product names. This is simulator
  evidence only, not physical-device or App Store acceptance evidence.

## Upload and ASC state

- A single official Xcode upload/export invocation for the archived build was
  started with provisioning updates permitted. No second upload was attempted.
- The local upload process subsequently ended, but a non-sensitive Apple success
  receipt or remote ASC build record could not be read in this run. Its remote
  processing/validation state is therefore `UNKNOWN`, not assumed successful.
- No App Store Connect metadata, screenshot, price, availability, build binding,
  review submission, IAP, subscription, payment, tax, or territory change was
  performed in this readback phase.

## GitHub Pages read-only recheck

- HTTP readback returned 200 for both public endpoints:
  `https://eli-ovops.github.io/focumi/privacy/` and
  `https://eli-ovops.github.io/focumi/support/`.
- The one allowed Chrome readback returned HTTP 502 for the support endpoint.
  Per scope, no further Pages refresh, rebuild, push, or configuration change
  was attempted. Browser-verifiable hosting status remains `HOSTING_FAILED`.

## Stop boundary

ASC processing/validation cannot be claimed without a readable ASC build record.
The Pages browser failure independently blocks use of the public URLs and any
review submission. No review submission was made.
