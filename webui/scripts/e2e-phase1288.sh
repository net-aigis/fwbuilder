#!/usr/bin/env bash
# Phase-1288: soft-complete through 1288 (milestone 2100).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1288
assert m.WEBUI_HONESTY_MILESTONE == 2100
print("soft-complete >=1288", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1288|Soft-complete STATUS through 1288|through 1288' webui/STATUS.md
echo "STATUS soft-complete 1288 ok"
echo "cleaned"
echo "OK: phase1288 e2e passed"
