# Authentication attempt — 2026-08-24

## Safe preflight

- `asc auth status` had already confirmed: no Keychain credentials and no complete environment credentials.
- `asc auth login --help` confirms this CLI is flag-driven; it has no credential-profile picker or Apple-ID/2FA interactive flow.

## Attempt

- Command started: `/Users/USER/.local/bin/asc auth login`
- Exact non-sensitive result: `Error: --name is required`.
- The command help further requires an existing credential name, Key ID, Issuer ID, and `.p8` private-key path (or individual-key equivalent).

## Boundary result

No home-directory search, credential-file read, private-key copy, credential creation, account change, Keychain write, or network App Store Connect request occurred.

## Required user action

On this Mac, authenticate the existing authorized App Store Connect API key with `asc auth login` by providing its name, Key ID, Issuer ID, and `.p8` file path locally. Do not send those values in chat. After it reports success, reply only that authentication is complete; this task can then resume at `asc auth status` and App lookup.
