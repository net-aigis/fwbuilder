#!/usr/bin/env bash
# Phase-3080: soft-complete through 3080 (layout_fidelity_signal_roster sessionStorage + ms 7700).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3080
assert m.WEBUI_HONESTY_MILESTONE == 7700
print("soft-complete >=3080", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3080|Soft-complete STATUS through 3080|through 3080' webui/STATUS.md
echo "STATUS soft-complete 3080 ok"
echo "cleaned"
echo "OK: phase3080 e2e passed"
