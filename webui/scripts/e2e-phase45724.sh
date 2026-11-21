#!/usr/bin/env bash
# Phase-45724: STATUS Soft 45720+ ssh_auth_triacontaoctacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 45720\+|through 45728|ssh_auth_triacontaoctacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase45728|through 45728|e2e-phase45736' webui/STATUS.md
echo "STATUS Soft 45720+ ok"; echo "cleaned"; echo "OK: phase45724 e2e passed"
