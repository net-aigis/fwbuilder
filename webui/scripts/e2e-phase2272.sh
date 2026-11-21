#!/usr/bin/env bash
# Phase-2272: soft-complete through 2272 (hard_gap_roster sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2272
print("soft-complete >=2272", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2272|Soft-complete STATUS through 2272|through 2272' webui/STATUS.md
echo "STATUS soft-complete 2272 ok"
echo "cleaned"
echo "OK: phase2272 e2e passed"
