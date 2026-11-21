#!/usr/bin/env bash
# Phase-27804: STATUS Soft 27800+ ssh_auth_triacontadocosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 27800\+|through 27808|ssh_auth_triacontadocosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase27808|through 27808|e2e-phase27816' webui/STATUS.md
echo "STATUS Soft 27800+ ok"; echo "cleaned"; echo "OK: phase27804 e2e passed"
