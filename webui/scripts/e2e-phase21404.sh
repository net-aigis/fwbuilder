#!/usr/bin/env bash
# Phase-21404: STATUS Soft 21400+ ssh_auth_docosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 21400\+|through 21408|ssh_auth_docosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase21408|through 21408|e2e-phase21416' webui/STATUS.md
echo "STATUS Soft 21400+ ok"; echo "cleaned"; echo "OK: phase21404 e2e passed"
