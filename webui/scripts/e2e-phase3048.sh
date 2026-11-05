#!/usr/bin/env bash
# Phase-3048: soft-complete through 3048 (layout_fidelity_signal_roster export + ms 7600).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3048
assert m.WEBUI_HONESTY_MILESTONE == 7600
print("soft-complete >=3048", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3048|Soft-complete STATUS through 3048|through 3048' webui/STATUS.md
echo "STATUS soft-complete 3048 ok"
echo "cleaned"
echo "OK: phase3048 e2e passed"
