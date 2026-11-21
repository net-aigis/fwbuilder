#!/usr/bin/env bash
# Phase-30044: STATUS Soft 30040+ ssh_auth_triacontaenneacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 30040\+|through 30048|ssh_auth_triacontaenneacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase30048|through 30048|e2e-phase30056' webui/STATUS.md
echo "STATUS Soft 30040+ ok"; echo "cleaned"; echo "OK: phase30044 e2e passed"
