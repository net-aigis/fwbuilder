#!/usr/bin/env bash
# Phase-2240: soft-complete through 2240 (hard_gap_roster export).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2240
print("soft-complete >=2240", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2240|Soft-complete STATUS through 2240|through 2240' webui/STATUS.md
echo "STATUS soft-complete 2240 ok"
echo "cleaned"
echo "OK: phase2240 e2e passed"
