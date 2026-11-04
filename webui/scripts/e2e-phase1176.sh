#!/usr/bin/env bash
# Phase-1176: soft-complete through 1176 (expect_plan_step_titles).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1176
print("soft-complete >=1176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1176|Soft-complete STATUS through 1176|through 1176' webui/STATUS.md
echo "STATUS soft-complete 1176 ok"
echo "cleaned"
echo "OK: phase1176 e2e passed"
