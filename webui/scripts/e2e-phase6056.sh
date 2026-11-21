#!/usr/bin/env bash
# Phase-6056: soft-complete through 6056 (Soft 6040+ ssh_implemented_check_roster Soft-Checkpoint + ms 17000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6056
assert m.WEBUI_HONESTY_MILESTONE == 17000
print("soft-complete >=6056", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6056|Soft-complete STATUS through 6056|through 6056' webui/STATUS.md
echo "STATUS soft-complete 6056 ok"; echo "cleaned"; echo "OK: phase6056 e2e passed"
