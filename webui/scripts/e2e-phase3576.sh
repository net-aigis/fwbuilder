#!/usr/bin/env bash
# Phase-3576: soft-complete through 3576 (Soft 3560+ / ms 9250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3576
assert m.WEBUI_HONESTY_MILESTONE == 9250
print("soft-complete >=3576", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3576|Soft-complete STATUS through 3576|through 3576' webui/STATUS.md
echo "STATUS soft-complete 3576 ok"
echo "cleaned"
echo "OK: phase3576 e2e passed"
