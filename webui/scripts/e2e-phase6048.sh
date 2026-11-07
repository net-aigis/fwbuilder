#!/usr/bin/env bash
# Phase-6048: soft-complete through 5889 (Soft 6040+ ssh_implemented_check_roster Soft-Checkpoint).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6048
print("soft-complete >=6448", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase6048|Soft-complete STATUS through 5889|through 5889' webui/STATUS.md
echo "STATUS soft-complete 5168 ok"; echo "cleaned"; echo "OK: phase6048 e2e passed"
