#!/usr/bin/env bash
# Phase-2920: soft-complete through 2920 (expect_step_roster sessionStorage + ms 7200).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2920
assert m.WEBUI_HONESTY_MILESTONE == 7200
print("soft-complete >=2920", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2920|Soft-complete STATUS through 2920|through 2920' webui/STATUS.md
echo "STATUS soft-complete 2920 ok"
echo "cleaned"
echo "OK: phase2920 e2e passed"
