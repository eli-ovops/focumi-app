# Focumi 0.6.0 submission execution readback — 2026-08-25

## Scope and preservation

- Target App Store Connect app: `6800585186`, iOS version `0.6.0`.
- No source, SwiftUI, asset, Xcode-project version/build, IAP, subscription,
  banking, tax, agreement, or build upload action was performed.
- The existing dirty worktree is preserved. No local project file was changed.

## Read-only ASC and public-page evidence

- ASC shows version `0.6.0` as `Prepare for Submission` and its release mode
  as automatic release.
- The version has no 6.5-inch screenshots and no attached build yet.
- The version’s support URL is
  `https://eli-ovops.github.io/focumi/support/`; live Chrome readback renders
  the public support page.
- Live Chrome readback renders the public privacy page at
  `https://eli-ovops.github.io/focumi/privacy/`.
- App Privacy is not started. Code review establishes on-device persistence,
  Apple Family Controls/Screen Time selection and shielding, local
  notifications, and Live Activities; it found no account login, network
  client, analytics SDK, advertising tracker, or third-party data transfer.
- App Information still has no primary category, age rating, or content-rights
  declaration. Price and availability have not been initialized. Copyright is
  blank.

## Stop point

`RELEASE_INPUT_REQUIRED`: an exact Apple-visible copyright owner text is
required. It must not be guessed from account or contact details. No metadata
save, screenshot upload, build binding, privacy declaration, pricing change,
or review submission was attempted while this input is missing.
