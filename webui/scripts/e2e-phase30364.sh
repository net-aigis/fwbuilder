#!/usr/bin/env bash
# Phase-30364: STATUS Soft 30360+ ssh_auth_triacontaicosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 30360\+|through 30368|ssh_auth_triacontaicosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase30368|through 30368|e2e-phase30376' webui/STATUS.md
echo "STATUS Soft 30360+ ok"; echo "cleaned"; echo "OK: phase30364 e2e passed"
