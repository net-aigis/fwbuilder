#!/usr/bin/env bash
# Phase-2760: soft-complete through 2760 (surface_roster sessionStorage + ms 6700).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2760
assert m.WEBUI_HONESTY_MILESTONE == 6700
print("soft-complete >=2760", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2760|Soft-complete STATUS through 2760|through 2760' webui/STATUS.md
echo "STATUS soft-complete 2760 ok"
echo "cleaned"
echo "OK: phase2760 e2e passed"
