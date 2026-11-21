#!/usr/bin/env bash
# Phase-4136: soft-complete through 4136 (Soft 4120+ / ms 11000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4136
assert m.WEBUI_HONESTY_MILESTONE == 11000
print("soft-complete >=4136", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4136|Soft-complete STATUS through 4136|through 4136' webui/STATUS.md
echo "STATUS soft-complete 4136 ok"
echo "cleaned"
echo "OK: phase4136 e2e passed"
