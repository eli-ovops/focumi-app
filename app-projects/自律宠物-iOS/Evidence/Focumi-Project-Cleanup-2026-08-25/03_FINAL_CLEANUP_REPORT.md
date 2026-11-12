# Focumi project cleanup report — 2026-08-25

## Outcome

- Status: `CLEANUP_HUMAN_REVIEW_REQUIRED`.
- Method: Finder moved each approved target to macOS Trash. Trash was not emptied; no permanent-delete command was used.
- Moved: 67 exact targets, 1,682,550,784 bytes (1604.61 MiB by pre-move disk accounting).
- Project size: 2,016,264 KiB before; 373,152 KiB after.

## Preserved / skipped

- `DisciplinedPet/DesignLab` was not moved because `DisciplinedPet.xcodeproj/project.pbxproj` explicitly references it.
- Required source, Xcode targets/tests/configuration, dirty modifications, runtime assets, Approved masters, selected direction, specified Docs, five retained Evidence directories, and `reasonix.toml` remain in place.

## Git boundary

- Pre-existing modified source/configuration/asset/test files were not edited or restored.
- Cleanup necessarily creates Git deletion entries for tracked historical material under `Design/CheckpointB_Return_Signature_Production_2026-08-14/` and `Docs/Focumi_Beta_v0.4_Cinematic_Return_Implementation_2026-08-12.md`; no Git staging, commit, reset, or checkout was performed.

## Recovery

Use Finder → Trash, select the needed item, then choose **Put Back**. The Trash has not been emptied.
