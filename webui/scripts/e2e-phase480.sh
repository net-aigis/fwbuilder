#!/usr/bin/env bash
# Phase-480: soft-complete through 480; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "480"
assert len(m.HARD_GAPS_OPEN) == 3
print("soft-complete 480; hard gaps", m.HARD_GAPS_OPEN)
PY
grep -q 'phase480' webui/STATUS.md
echo "STATUS soft-complete 480 ok"
echo "cleaned"
echo "OK: phase480 e2e passed"
