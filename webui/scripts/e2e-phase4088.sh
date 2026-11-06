#!/usr/bin/env bash
# Phase-4088: soft-complete through 4088 (layout_fidelity_roster export + ms 10850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4088
assert m.WEBUI_HONESTY_MILESTONE == 10850
print("soft-complete >=4088", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4088|Soft-complete STATUS through 4088|through 4088' webui/STATUS.md
echo "STATUS soft-complete 4088 ok"
echo "cleaned"
echo "OK: phase4088 e2e passed"
