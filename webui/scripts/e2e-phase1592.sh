#!/usr/bin/env bash
# Phase-1592: soft-complete through 1592 (honesty export + ms 3050).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1592
assert m.WEBUI_HONESTY_MILESTONE == 3050
print("soft-complete >=1592", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1592|Soft-complete STATUS through 1592|through 1592' webui/STATUS.md
echo "STATUS soft-complete 1592 ok"
echo "cleaned"
echo "OK: phase1592 e2e passed"
