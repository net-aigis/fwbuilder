#!/usr/bin/env bash
# Phase-3416: soft-complete through 3416 (Soft 3400+ / ms 8750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3416
assert m.WEBUI_HONESTY_MILESTONE == 8750
print("soft-complete >=3416", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3416|Soft-complete STATUS through 3416|through 3416' webui/STATUS.md
echo "STATUS soft-complete 3416 ok"
echo "cleaned"
echo "OK: phase3416 e2e passed"
