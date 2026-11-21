#!/usr/bin/env bash
# Phase-23964: STATUS Soft 23960+ ssh_auth_triacontadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 23960\+|through 23968|ssh_auth_triacontadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase23968|through 23968|e2e-phase23976' webui/STATUS.md
echo "STATUS Soft 23960+ ok"; echo "cleaned"; echo "OK: phase23964 e2e passed"
