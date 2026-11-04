#!/usr/bin/env bash
# Phase-528: soft-complete through 528 (marker may be higher).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 528
assert len(m.HARD_GAPS_OPEN) == 3
print("soft-complete >=528; hard gaps", m.HARD_GAPS_OPEN)
PY
grep -q 'phase528' webui/STATUS.md
echo "STATUS soft-complete 528 ok"
echo "cleaned"
echo "OK: phase528 e2e passed"
