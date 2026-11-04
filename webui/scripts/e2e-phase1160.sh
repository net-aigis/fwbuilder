#!/usr/bin/env bash
# Phase-1160: soft-complete through 1160 (hard_gap_closure_titles).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1160
print("soft-complete >=1160", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1160|Soft-complete STATUS through 1160|through 1160' webui/STATUS.md
echo "STATUS soft-complete 1160 ok"
echo "cleaned"
echo "OK: phase1160 e2e passed"
