# EULA sync recheck and DSA blocker — 2026-08-25

Status: **RELEASE_INPUT_REQUIRED**

## One-time synchronization recheck

- Waited 30 seconds (within the 60-second cap), then performed one hard refresh of the authenticated Google Chrome App Store Connect tab.
- The Apple Developer Program License Agreement warning is no longer present after that refresh. No agreement, prompt, or legal notice was clicked or accepted by this task.

## Current hard blocker

- The refreshed App Store Connect page displays the EU Digital Services Act trader-status advisory. It states that a trader status must be provided to submit new apps or app updates for EU distribution, and otherwise an app will be removed from EU storefronts.
- This task cannot determine or declare whether the account holder is a trader or non-trader, and it may not change existing availability/territories.

## Stop boundary

- No Focumi version page was opened after the DSA blocker was confirmed.
- No version alignment, build attachment, metadata/privacy/review update, IAP/subscription action, territory action, submit-for-review action, or automatic-release action was performed.

## Required user decision

Please personally determine the legally accurate trader/non-trader status for the existing EU availability in App Store Connect. If Focumi should not be available in EU, do not change territories in this task; provide separate explicit authorization for any availability change. Once the factual trader-status issue is resolved in App Store Connect, resume the release preflight from the existing Focumi record.
