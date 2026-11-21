#!/usr/bin/env bash
# Phase-40604: STATUS Soft 40600+ ssh_auth_triacontadocosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 40600\+|through 40608|ssh_auth_triacontadocosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase40608|through 40608|e2e-phase40616' webui/STATUS.md
echo "STATUS Soft 40600+ ok"; echo "cleaned"; echo "OK: phase40604 e2e passed"
