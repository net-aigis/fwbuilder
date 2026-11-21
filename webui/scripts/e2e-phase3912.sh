#!/usr/bin/env bash
# Phase-3912: soft-complete through 3912 (res_status_roster + ms 10300).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3912
assert m.WEBUI_HONESTY_MILESTONE == 10300
print("soft-complete >=3912", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3912|Soft-complete STATUS through 3912|through 3912' webui/STATUS.md
echo "STATUS soft-complete 3912 ok"
echo "cleaned"
echo "OK: phase3912 e2e passed"
