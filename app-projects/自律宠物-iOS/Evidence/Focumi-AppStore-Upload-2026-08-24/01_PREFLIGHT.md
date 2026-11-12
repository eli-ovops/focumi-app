# App Store preflight

Status: **BLOCKED — AUTH_REQUIRED**

- Tool health: Xcode 26.6 (17F113) is available. `asc` is not executable from the current shell and was not present in the checked existing local CLI locations.
- Therefore `asc doctor`, `asc auth status`, App lookup, remote build lookup, canonical `asc validate`, and entitlement/provisioning verification cannot be run.
- No CLI/package installation, authentication change, certificate/profile creation, or account mutation was attempted.
- Local syntax checks passed: `git diff --check`, `plutil -lint Config/DisciplinedPet-Info.plist Config/*.entitlements`.
- Static entitlement inspection finds Family Controls on the app, Monitor, Shield Action, and Shield Configuration targets. Whether the App Store distribution provisioning profiles carry that entitlement is **UNKNOWN** until authenticated signing/archive verification.
- No App Store metadata was modified. Missing/incomplete metadata was not treated as permission to alter it.

Required resumption condition: make an already-authorized `asc` CLI available in the execution environment and ensure it can authenticate without exposing credentials. Resume at tool-health and App lookup; do not assume an App ID or remote next build number.
