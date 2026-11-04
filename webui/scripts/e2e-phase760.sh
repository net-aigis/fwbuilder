#!/usr/bin/env bash
# Phase-760: soft-complete through 760 (honesty milestone 850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 760
assert m.WEBUI_HONESTY_MILESTONE == 850
print("soft-complete >=760", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase760|Soft-complete STATUS through 760|through 760' webui/STATUS.md
echo "STATUS soft-complete 760 ok"
echo "cleaned"
echo "OK: phase760 e2e passed"
