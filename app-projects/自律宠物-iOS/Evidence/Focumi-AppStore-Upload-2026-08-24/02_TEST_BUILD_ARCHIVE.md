# Test, build, archive, export

Status: **NOT RUN — blocked before release build**

The required remote App lookup and safe next build-number query cannot run because `asc` is unavailable. To avoid producing an archive that could carry an already-used build number, no tests, archive, export, IPA inspection, or signing/provisioning operation was started.

No DerivedData, archive, IPA, provisioning profile, certificate, entitlement, or source file was deleted or changed.
