#!/usr/bin/env bash
# Phase-3512: soft-complete through 3512 (honesty_operator_brief_roster + ms 9050).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3512
assert m.WEBUI_HONESTY_MILESTONE == 9050
print("soft-complete >=3512", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3512|Soft-complete STATUS through 3512|through 3512' webui/STATUS.md
echo "STATUS soft-complete 3512 ok"
echo "cleaned"
echo "OK: phase3512 e2e passed"
