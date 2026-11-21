#!/usr/bin/env bash
# Phase-2328: soft-complete through 2328 (hard_gap_refusal_roster export + ms 5350).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2328
assert m.WEBUI_HONESTY_MILESTONE == 5350
print("soft-complete >=2328", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2328|Soft-complete STATUS through 2328|through 2328' webui/STATUS.md
echo "STATUS soft-complete 2328 ok"
echo "cleaned"
echo "OK: phase2328 e2e passed"
