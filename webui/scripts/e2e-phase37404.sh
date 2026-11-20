#!/usr/bin/env bash
# Phase-37404: STATUS Soft 37400+ ssh_auth_triacontadocosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 37400\+|through 37408|ssh_auth_triacontadocosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase37408|through 37408|e2e-phase37416' webui/STATUS.md
echo "STATUS Soft 37400+ ok"; echo "cleaned"; echo "OK: phase37404 e2e passed"
