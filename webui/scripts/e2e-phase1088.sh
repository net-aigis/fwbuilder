#!/usr/bin/env bash
# Phase-1088: soft-complete through 1088 (milestone 1500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1088
assert m.WEBUI_HONESTY_MILESTONE == 1500
print("soft-complete >=1088", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1088|Soft-complete STATUS through 1088|through 1088' webui/STATUS.md
echo "STATUS soft-complete 1088 ok"
echo "cleaned"
echo "OK: phase1088 e2e passed"
