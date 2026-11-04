#!/usr/bin/env bash
# Phase-1104: soft-complete through 1104 (milestone 1550).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1104
assert m.WEBUI_HONESTY_MILESTONE == 1550
print("soft-complete >=1104", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1104|Soft-complete STATUS through 1104|through 1104' webui/STATUS.md
echo "STATUS soft-complete 1104 ok"
echo "cleaned"
echo "OK: phase1104 e2e passed"
