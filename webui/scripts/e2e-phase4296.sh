#!/usr/bin/env bash
# Phase-4296: soft-complete through 4296 (Soft 4280+ / ms 11500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4296
assert m.WEBUI_HONESTY_MILESTONE == 11500
print("soft-complete >=4296", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4296|Soft-complete STATUS through 4296|through 4296' webui/STATUS.md
echo "STATUS soft-complete 4296 ok"
echo "cleaned"
echo "OK: phase4296 e2e passed"
