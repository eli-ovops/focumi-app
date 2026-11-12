# User check required on the installed physical iPhone

Installation and one launched screen are automated evidence. Please perform the following without clearing app data; mark each result independently.

1. Return to the SpringBoard and confirm the app name is **Focumi** and the icon is the new Milo/Max side-peeking icon.
2. Force-close and cold-launch Focumi; confirm the desired launch/poster state and no crash.
3. Open Settings in Focumi: confirm no internal/development content is visible.
4. Confirm the language menu contains **Follow System**, **中文**, and **English**. Switch Chinese then English, confirming UI text changes as intended.
5. From Meet/companion selection, confirm both Milo and Max can be selected, confirmed, and lead into Task Setup.
6. In English, confirm 30 / 45 / 60 use `min` (never `mins` or `m`), while Chinese minute values remain `分钟`. Static source/test evidence currently renders 120 as `2 hours`, not `120 min`; treat that as a separate acceptance decision/failure if the intended requirement is `120 min`.
7. Confirm the Start Focus entry proceeds through the expected user flow. Treat shield, monitor, and Live Activity behavior as separate Apple-system checks.

Do not treat this checklist as an App Store release approval. Report any failed step with the screen and exact action that produced it.
