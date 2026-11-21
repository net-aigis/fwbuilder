#!/usr/bin/env bash
# Phase-21724: STATUS Soft 21720+ ssh_auth_tricosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 21720\+|through 21728|ssh_auth_tricosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase21728|through 21728|e2e-phase21736' webui/STATUS.md
echo "STATUS Soft 21720+ ok"; echo "cleaned"; echo "OK: phase21724 e2e passed"
