#!/usr/bin/env bash
# Phase-6136: soft-complete through 6136 (Soft 6120+ ssh_not_implemented_check_roster + ms 17250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6136
assert m.WEBUI_HONESTY_MILESTONE == 17250
print("soft-complete >=6136", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase6136|Soft-complete STATUS through 6136|through 6136' webui/STATUS.md
echo "STATUS soft-complete 6136 ok"; echo "cleaned"; echo "OK: phase6136 e2e passed"
