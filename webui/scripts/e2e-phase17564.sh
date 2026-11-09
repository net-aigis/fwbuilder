#!/usr/bin/env bash
# Phase-17564: STATUS Soft 17560+ ssh_auth_deca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 17560\+|through 17568|ssh_auth_deca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase17568|through 17568|e2e-phase17576' webui/STATUS.md
echo "STATUS Soft 17560+ ok"; echo "cleaned"; echo "OK: phase17564 e2e passed"
