# GitHub Pages and support-contact gate — 2026-08-25

## Completed, scoped external actions

- Created the separate public repository `eli-ovops/focumi`; no existing Focumi repository, branch, or unrelated project was modified.
- Created and pushed only the `gh-pages` branch, commit `d45d4ca5723812bb47e9ea74f97e78cbf0e284fc`.
- The branch contains the minimal Focumi privacy and support pages plus a non-secret `site.yaml` delivery contract.
- GitHub Pages reports `built`, source `gh-pages` at `/`, and candidate public root `https://eli-ovops.github.io/focumi/`.

## Privacy-content basis

- Source audit found local persistence, Family Controls/Managed Settings, local notifications, and Live Activity usage.
- The audit found no outbound network client, account sign-in feature, or third-party analytics/advertising SDK in the scoped Swift and configuration search.
- The public-policy text is therefore limited to those source-supported facts.

## Blocking condition

- The support page deliberately has no usable public contact yet. A real support email was authorized for use only inside the already logged-in Apple UI, but the required logged-in GitHub browser editor session could not be reached through the available browser control surfaces.
- No personal contact value was written to repository content, evidence, logs, screenshots, or chat.
- Browser acceptance of `/privacy/` and `/support/` was not performed. The Pages build result is not acceptance evidence.

## Release consequence

`SUPPORT_CONTACT_REQUIRED`: do not use these candidate URLs in App Store Connect, do not start Build 12, and do not submit the app until an authenticated GitHub editor session permits insertion and browser verification of the true support contact.

## Preserved boundaries

- The Focumi iOS working tree was not edited; version remains unchanged by this run.
- No IAP, subscription, price, territory, bank, tax, paid agreement, Apple submission, or App Store Connect metadata was changed.
