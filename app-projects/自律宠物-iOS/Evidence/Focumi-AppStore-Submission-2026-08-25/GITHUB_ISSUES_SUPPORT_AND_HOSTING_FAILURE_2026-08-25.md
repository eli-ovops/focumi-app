# GitHub Issues support update and Pages verification failure — 2026-08-25

## Support-channel correction

- Repository Issues are enabled for `eli-ovops/focumi`.
- Commit `41a4c91637d2283dd14f50922c3ab32bd6bfcb6e` updates both the public support and privacy pages to link to the public GitHub Issue template `support.md`.
- The support page labels that route **Open a support request** and asks users not to post personal information, private screenshots, or Screen Time app-selection details.
- This channel does not use, copy, or expose the Apple account holder’s private email.

## Pages state and browser evidence

- GitHub Pages API reports source `gh-pages`, path `/`, and `built` for the candidate root `https://eli-ovops.github.io/focumi/`.
- A real Chrome visit to `https://eli-ovops.github.io/focumi/support/` returned HTTP 502. One wait-and-refresh recheck returned the same HTTP 502.
- Because the public support page did not load, its Issue link and the privacy page cannot be accepted as browser-verified public URLs.

## Release consequence

`HOSTING_FAILED`: do not enter either candidate URL in App Store Connect; do not change Focumi’s version/build; do not create screenshots; do not archive/upload Build 12; and do not submit for review.

## Preserved boundaries

- Focumi iOS source, assets, signing, marketing version, and build number were not modified in this run.
- No App Store Connect fields, IAP, subscriptions, price, availability, territories, bank/tax settings, paid agreements, or review submission were changed.
