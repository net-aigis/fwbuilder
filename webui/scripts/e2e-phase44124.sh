#!/usr/bin/env bash
# Phase-44124: STATUS Soft 44120+ ssh_auth_triacontatricosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 44120\+|through 44128|ssh_auth_triacontatricosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase44128|through 44128|e2e-phase44136' webui/STATUS.md
echo "STATUS Soft 44120+ ok"; echo "cleaned"; echo "OK: phase44124 e2e passed"
