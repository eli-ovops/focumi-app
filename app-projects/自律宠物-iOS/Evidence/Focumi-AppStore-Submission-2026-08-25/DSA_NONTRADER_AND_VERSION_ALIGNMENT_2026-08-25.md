# Focumi DSA and Version Alignment — 2026-08-25

## Scope and authorization

- App Store Connect app: Focumi (Apple app record `6800585186`).
- Authorized account-level action: declare the current account as a DSA non-trader.
- Authorized app-level action: directly change the unsubmitted iOS version string from `1.0` to `0.6.0`, without deleting or creating a version.

## Apple UI evidence

- The DSA dialog's non-trader option was selected and submitted.
- After refresh, Business compliance stated that all regulatory requirements were complete and listed Digital Services Act as valid.
- No paid agreement, banking, tax, availability, IAP, subscription, or other account-profile change was made.
- After saving and refreshing the Focumi version page, both the navigation item and page heading showed `0.6.0 — Prepare for Submission`; the Version field showed `0.6.0` and Save was disabled.
- The existing automatic-release option remained selected; it was not changed in this run.

## Remaining release blockers observed on the refreshed version page

- No build is attached; build 11 processing/VALID state is therefore not established from this release page.
- iPhone 6.5-inch media shows 0 previews and 0 screenshots.
- Description, keywords, support URL, copyright, reviewer contact details, and reviewer notes are blank.
- The Add for Review control is unavailable.

## Outcome

No submission was attempted. The release remains `RELEASE_INPUT_REQUIRED` pending the real required store, privacy, review, and build information.
