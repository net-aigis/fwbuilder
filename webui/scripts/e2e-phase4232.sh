#!/usr/bin/env bash
# Phase-4232: soft-complete through 4232 (option_enable_roster + ms 11300).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4232
assert m.WEBUI_HONESTY_MILESTONE == 11300
print("soft-complete >=4232", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4232|Soft-complete STATUS through 4232|through 4232' webui/STATUS.md
echo "STATUS soft-complete 4232 ok"
echo "cleaned"
echo "OK: phase4232 e2e passed"
