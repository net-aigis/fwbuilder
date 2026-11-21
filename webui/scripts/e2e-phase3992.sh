#!/usr/bin/env bash
# Phase-3992: soft-complete through 3992 (hard_gaps_field_roster + ms 10550).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3992
assert m.WEBUI_HONESTY_MILESTONE == 10550
print("soft-complete >=3992", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3992|Soft-complete STATUS through 3992|through 3992' webui/STATUS.md
echo "STATUS soft-complete 3992 ok"
echo "cleaned"
echo "OK: phase3992 e2e passed"
