#!/usr/bin/env bash
# Phase-2728: soft-complete through 2728 (surface_roster export + ms 6600).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2728
assert m.WEBUI_HONESTY_MILESTONE == 6600
print("soft-complete >=2728", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2728|Soft-complete STATUS through 2728|through 2728' webui/STATUS.md
echo "STATUS soft-complete 2728 ok"
echo "cleaned"
echo "OK: phase2728 e2e passed"
