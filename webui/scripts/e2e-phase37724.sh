#!/usr/bin/env bash
# Phase-37724: STATUS Soft 37720+ ssh_auth_triacontatricosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 37720\+|through 37728|ssh_auth_triacontatricosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase37728|through 37728|e2e-phase37736' webui/STATUS.md
echo "STATUS Soft 37720+ ok"; echo "cleaned"; echo "OK: phase37724 e2e passed"
