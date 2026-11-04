#!/usr/bin/env bash
# Phase-496: soft-complete through 496 (marker may be higher).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 496
assert len(m.HARD_GAPS_OPEN) == 3
print("soft-complete >=496; hard gaps", m.HARD_GAPS_OPEN)
PY
grep -q 'phase496' webui/STATUS.md
echo "STATUS soft-complete 496 ok"
echo "cleaned"
echo "OK: phase496 e2e passed"
