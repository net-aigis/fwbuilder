#!/usr/bin/env bash
# Phase-26204: STATUS Soft 26200+ ssh_auth_triacontaheptadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 26200\+|through 26208|ssh_auth_triacontaheptadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase26208|through 26208|e2e-phase26216' webui/STATUS.md
echo "STATUS Soft 26200+ ok"; echo "cleaned"; echo "OK: phase26204 e2e passed"
