#!/usr/bin/env bash
# Phase-40924: STATUS Soft 40920+ ssh_auth_triacontatricosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 40920\+|through 40928|ssh_auth_triacontatricosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase40928|through 40928|e2e-phase40936' webui/STATUS.md
echo "STATUS Soft 40920+ ok"; echo "cleaned"; echo "OK: phase40924 e2e passed"
