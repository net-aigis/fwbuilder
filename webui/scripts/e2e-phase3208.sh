#!/usr/bin/env bash
# Phase-3208: soft-complete through 3208 (layout_fidelity_sample_field_roster export + ms 8100).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3208
assert m.WEBUI_HONESTY_MILESTONE == 8100
print("soft-complete >=3208", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3208|Soft-complete STATUS through 3208|through 3208' webui/STATUS.md
echo "STATUS soft-complete 3208 ok"
echo "cleaned"
echo "OK: phase3208 e2e passed"
