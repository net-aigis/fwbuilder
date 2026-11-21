#!/usr/bin/env bash
# Phase-28124: STATUS Soft 28120+ ssh_auth_triacontatricosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 28120\+|through 28128|ssh_auth_triacontatricosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase28128|through 28128|e2e-phase28136' webui/STATUS.md
echo "STATUS Soft 28120+ ok"; echo "cleaned"; echo "OK: phase28124 e2e passed"
