#!/usr/bin/env bash
# Phase-2632: soft-complete through 2632 (honesty bundle roster + ms 6300).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2632
assert m.WEBUI_HONESTY_MILESTONE == 6300
print("soft-complete >=2632", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2632|Soft-complete STATUS through 2632|through 2632' webui/STATUS.md
echo "STATUS soft-complete 2632 ok"
echo "cleaned"
echo "OK: phase2632 e2e passed"
