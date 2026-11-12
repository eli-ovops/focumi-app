# Focumi release-materials audit — 2026-08-25

## Scope

- Read-only audit of local project materials and the visible App Store Connect session for Focumi (`6800585186`).
- No source, assets, project version, price, availability, IAP, subscription, agreement, banking, tax, or review submission change was made.

## Confirmed facts

- Local project settings declare marketing version `0.6.0` and build `11`; the main bundle identifier is `com.cczij.disciplinedpet`.
- App Store Connect shows the unsubmitted iOS version as `0.6.0` and the app name as Focumi.
- Build metadata for the visible `0.6.0 (11)` build shows binary status `Verified`, bundle `com.cczij.disciplinedpet`, and non-exempt encryption `No`.
- The version has no attached build and no iPhone screenshots.
- Automatic release remains selected.
- The account/app DSA display states that the developer is not a trader.

## Local material audit

- `Docs/Focumi_v0.6_Milo_Only_Core_Experience_PRD_Final.md` and the brand-naming research support the product facts: a Milo focus companion, a task and duration, return-to-focus flow, and optional Screen Time / Family Controls limitation of selected distracting apps.
- No authoritative public support URL or privacy-policy URL was found in the repository.
- No Privacy Manifest was found. The limited static search found local storage and Family Controls/Managed Settings use, but no network client or third-party analytics SDK. This is not a final legal App Privacy declaration.
- Existing project screenshots are historical/QA/design materials rather than a provenance-matched App Store screenshot set for build 11; none was uploaded.

## App Store Connect blockers observed

- App Privacy is not started or published; privacy-policy URL is blank.
- App Info has no subtitle, primary category, age rating, or content-rights declaration.
- Version metadata has no description, keywords, support URL, copyright, screenshots, attached build, reviewer contact, or review notes.
- Price & Availability asks to set an initial price and availability. The price matrix has no price values and the availability section offers initial setup; no existing territory configuration was visible to preserve.

## Required user-owned inputs before submission

1. Public HTTPS privacy-policy URL and public HTTPS support URL.
2. Copyright owner text.
3. Review contact name, email, and phone number.
4. Exact availability territories (the ASC record currently has none to preserve).
5. Confirmed App Store category, age-rating answers, and content-rights declaration.
6. Approval of an App Store screenshot set that is demonstrably representative of build 11.

## Result

`RELEASE_INPUT_REQUIRED`. No submission attempt or validation run was made because required Apple-visible facts remain missing.
