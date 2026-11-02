# Firewall Builder modernization – project origin

Baseline decision, 2026-10-17. This file records project provenance, not a feature release.

- Distribution repository: `net-aigis/fwbuilder` (independent, private GitHub repository).
- Starting source: `computersalat/fwbuilder`, branch `5.3.x`.
- Starting commit: `46d2f67e9d7929c10791bb6747627066a3ea5c26`.
- Preserve the source branches `5.3.x`, `5.3`, and `master` unchanged.
- Former development branch `modernization/start` is now `main` (product line 6.0).
- Initial tip matched `5.3.x`; upstream CMake history lives under `archive/upstream-cmake-master`.
- Original upstream: `fwbuilder/fwbuilder`, branch `master`.
- Existing GPL license and author notices remain in force. No proprietary relicensing of derivative GPL code.

## Engineering constraints

1. Preserve the brother's `5.3.x` work; compare against upstream without blind merges.
2. Review changes from other forks by commit, test and platform; never bulk-merge them.
3. Establish a reproducible build before changing firewall compilers.
4. Compare generated firewall output on fixed test fixtures and verify firewall semantics before deployment.
5. Keep separate records of feature status: reported / source-checked / compiled / regression-tested / runtime-tested.
6. Do not publish claims of supported platforms without corresponding evidence.
7. Do not publish project or customer configuration files, keys, credentials or host data.

## Commercial distribution

The GPL permits selling copies and support but grants recipients redistribution rights for the GPL-covered software. The private repository restricts public access before distribution, not the recipients' GPL rights. Any later storefront on net-aigis.de must not claim exclusive, non-redistributable licensing of GPL-derived binaries.
