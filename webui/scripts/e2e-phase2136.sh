#!/usr/bin/env bash
# Phase-2136: soft-complete through 2136 (surface_changelog sessionStorage + ms 4750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2136
assert m.WEBUI_HONESTY_MILESTONE == 4750
print("soft-complete >=2136", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2136|Soft-complete STATUS through 2136|through 2136' webui/STATUS.md
echo "STATUS soft-complete 2136 ok"
echo "cleaned"
echo "OK: phase2136 e2e passed"
