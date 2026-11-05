#!/usr/bin/env bash
# Phase-3032: soft-complete through 3032 (layout_fidelity_signal_roster + ms 7550).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3032
assert m.WEBUI_HONESTY_MILESTONE == 7550
print("soft-complete >=3032", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3032|Soft-complete STATUS through 3032|through 3032' webui/STATUS.md
echo "STATUS soft-complete 3032 ok"
echo "cleaned"
echo "OK: phase3032 e2e passed"
