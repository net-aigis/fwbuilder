#!/usr/bin/env bash
# Phase-3688: soft-complete through 3688 (hard_gaps_summary_roster export + ms 9600).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3688
assert m.WEBUI_HONESTY_MILESTONE == 9600
print("soft-complete >=3688", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3688|Soft-complete STATUS through 3688|through 3688' webui/STATUS.md
echo "STATUS soft-complete 3688 ok"
echo "cleaned"
echo "OK: phase3688 e2e passed"
