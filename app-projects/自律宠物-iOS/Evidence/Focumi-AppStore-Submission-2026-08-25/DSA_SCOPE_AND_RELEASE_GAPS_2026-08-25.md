# DSA scope boundary and live release gaps — 2026-08-25

Status: **RELEASE_INPUT_REQUIRED**

## DSA scope result

- Focumi App Information confirms App ID `6800585186` and bundle ID `com.cczij.disciplinedpet`.
- Its Digital Services Act section says that account-related information must be provided and verified, and its only Settings link opens the account-level Business area.
- This is not a demonstrably Focumi-only declaration surface. Entering it could affect account-global DSA status or other apps, which is outside the supplied authorization. It was not opened and no trader/non-trader declaration was submitted.

## Live release facts (read-only)

- The only editable iOS version is `1.0`, status `准备提交`; its Version field is `1.0`.
- Build section contains no attached build and displays an add-build control. Therefore requested build `0.6.0 (11)` is not attached or confirmed `VALID`.
- iPhone 6.5-inch media is `0/10` screenshots and `0/3` previews.
- The version metadata fields observed empty include description, keywords, support URL, copyright, reviewer contact fields, and reviewer notes.
- Automatic release is currently selected, but that setting does not cure the missing submission requirements.
- App Information has no subtitle, no content-rights information set, no primary category selected, and age rating remains unconfigured. App Privacy, pricing/availability and other release fields were not changed.

## Stop boundary

No DSA declaration, version rename, build upload/attachment, metadata/privacy/review change, IAP/subscription action, availability/territory change, Submit for Review, or automatic-release setting change was performed.

## Required decisions / inputs

1. Provide explicit authorization for the account-level Business/DSA declaration surface, or have the user complete the Non-trader declaration there personally.
2. Resolve whether the existing ASC `1.0` version may be renamed to `0.6.0` without conflict; no deletion/recreation is authorized.
3. Supply or authorize truthful App Store metadata, screenshots, privacy disclosures, content-rights/category/age-rating answers, and real reviewer contact/notes before any submission attempt.
