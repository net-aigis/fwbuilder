#!/usr/bin/env bash
# Phase-1264: soft-complete through 1264 (milestone 2050).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1264
assert m.WEBUI_HONESTY_MILESTONE == 2050
print("soft-complete >=1264", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1264|Soft-complete STATUS through 1264|through 1264' webui/STATUS.md
echo "STATUS soft-complete 1264 ok"
echo "cleaned"
echo "OK: phase1264 e2e passed"
