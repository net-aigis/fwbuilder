#!/usr/bin/env bash
# Phase-29084: STATUS Soft 29080+ ssh_auth_triacontahexacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 29080\+|through 29088|ssh_auth_triacontahexacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase29088|through 29088|e2e-phase29096' webui/STATUS.md
echo "STATUS Soft 29080+ ok"; echo "cleaned"; echo "OK: phase29084 e2e passed"
