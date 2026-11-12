# Implementation summary

- Milo/Max remains an explicit first-run choice. Persisted `.cat`/`.dog` still mean Milo/Max and are not rewritten. The simulator onboarding fixture can start on Max without changing production's Milo default.
- Formal settings stays dual-companion and all of its user-visible labels, picker values, status values, and recovery copy are Chinese.
- `FocumiDesignLab.swift` remains in the repository as historical material, but is absent from the production app Sources build phase and `DisciplinedPetApp` always starts `FocumiProductionRoot`.
- Static waiting routing is now `FocumiMiloWaiting` / `FocumiMaxWaiting`; no Return phase was added.
- `--p0-simulator-closure-demo` and its authorization, zero-selection, relock-failed, and relock-unknown variants are compiled only by `DEBUG && targetEnvironment(simulator)`. They use app-owned state/reducer projection and local receipts only: no AuthorizationCenter request, ManagedSettings write, or Apple Shield claim.
- Every fixture capture has a visible `模拟器验证状态` badge stating that it is not an Apple-owned Shield or system UI.
- Formal-settings residual scan found no English user copy; its only ASCII match is the product name `iPhone` in an otherwise Chinese privacy sentence. See `logs/formal-settings-english-residual-scan.txt`.
