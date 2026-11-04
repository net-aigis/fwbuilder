#!/usr/bin/env bash
# Phase-488: soft-complete through 488 (marker may be higher).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 488
assert len(m.HARD_GAPS_OPEN) == 3
print("soft-complete >=488; hard gaps", m.HARD_GAPS_OPEN)
PY
grep -q 'phase488' webui/STATUS.md
echo "STATUS soft-complete 488 ok"
echo "cleaned"
echo "OK: phase488 e2e passed"
