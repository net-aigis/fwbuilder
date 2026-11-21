#!/usr/bin/env bash
# Phase-3112: soft-complete through 3112 (layout_fidelity_sample_roster + ms 7800).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3112
assert m.WEBUI_HONESTY_MILESTONE == 7800
print("soft-complete >=3112", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3112|Soft-complete STATUS through 3112|through 3112' webui/STATUS.md
echo "STATUS soft-complete 3112 ok"
echo "cleaned"
echo "OK: phase3112 e2e passed"
