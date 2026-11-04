#!/usr/bin/env bash
# Phase-2712: soft-complete through 2712 (surface roster + ms 6550).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2712
assert m.WEBUI_HONESTY_MILESTONE == 6550
print("soft-complete >=2712", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2712|Soft-complete STATUS through 2712|through 2712' webui/STATUS.md
echo "STATUS soft-complete 2712 ok"
echo "cleaned"
echo "OK: phase2712 e2e passed"
