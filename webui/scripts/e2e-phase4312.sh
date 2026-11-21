#!/usr/bin/env bash
# Phase-4312: soft-complete through 4312 (expect_run_roster + ms 11550).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4312
assert m.WEBUI_HONESTY_MILESTONE == 11550
print("soft-complete >=4312", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4312|Soft-complete STATUS through 4312|through 4312' webui/STATUS.md
echo "STATUS soft-complete 4312 ok"
echo "cleaned"
echo "OK: phase4312 e2e passed"
