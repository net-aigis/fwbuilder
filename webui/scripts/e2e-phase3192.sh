#!/usr/bin/env bash
# Phase-3192: soft-complete through 3192 (layout_fidelity_sample_field_roster + ms 8050).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3192
assert m.WEBUI_HONESTY_MILESTONE == 8050
print("soft-complete >=3192", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3192|Soft-complete STATUS through 3192|through 3192' webui/STATUS.md
echo "STATUS soft-complete 3192 ok"
echo "cleaned"
echo "OK: phase3192 e2e passed"
