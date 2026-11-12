# asc CLI installation — 2026-08-24

## Source verification

- Official installation documentation: https://docs.asccli.sh/installation
- Official repository: https://github.com/rorkai/App-Store-Connect-CLI
- Official latest stable release inspected before installation: `4.9.0` (release commit `563ee9e`).
- License: MIT.
- The official documentation recommends Homebrew. Homebrew is not installed in this environment, so the documented official `https://asccli.sh/install` installer was used after read-only inspection.
- The inspected installer downloads the release binary and checksum manifest from the repository's GitHub Releases endpoint, compares SHA-256 with `shasum`, and installs only the verified executable.

## Installation record

- Command: `curl -fsSL https://asccli.sh/install | env INSTALL_DIR=/Users/USER/.local/bin bash`
- Install path: `/Users/USER/.local/bin/asc`
- Installed version: `4.9.0 (commit: 563ee9e, date: 2026-08-23T15:26:47+05:30)`.
- Non-sensitive verification: installer reported `Checksum verified.`
- No shell profile/PATH, project source, Xcode configuration, credentials, or unrelated dependency was changed.

## Post-install status

- `asc doctor`: system keychain is available; no stored credentials and no private keys found; no orphaned temporary key files.
- `asc auth status`: system keychain backend; credentials list empty; no complete environment credentials.
- Authentication state: `AUTH_REQUIRED`.

## Required user action

Supply or select an existing App Store Connect API credential through the normal `asc auth login` flow (API key ID, issuer ID, and the existing `.p8` file), including any required interactive confirmation. Do not send secret values in chat. Once authentication reports a configured credential, resume from App lookup and remote safe-build-number discovery.
