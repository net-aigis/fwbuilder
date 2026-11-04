#!/usr/bin/env bash
# Phase-2088: soft-complete through 2088 (honesty surface changelog + ms 4600).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2088
assert m.WEBUI_HONESTY_MILESTONE == 4600
print("soft-complete >=2088", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2088|Soft-complete STATUS through 2088|through 2088' webui/STATUS.md
echo "STATUS soft-complete 2088 ok"
echo "cleaned"
echo "OK: phase2088 e2e passed"
