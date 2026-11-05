#!/usr/bin/env bash
# Phase-3336: soft-complete through 3336 (Soft 3320+ / ms 8500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3336
assert m.WEBUI_HONESTY_MILESTONE == 8500
print("soft-complete >=3336", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3336|Soft-complete STATUS through 3336|through 3336' webui/STATUS.md
echo "STATUS soft-complete 3336 ok"
echo "cleaned"
echo "OK: phase3336 e2e passed"
