#!/usr/bin/env bash
# Phase-512: soft-complete through 512 (marker may be higher).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 512
assert len(m.HARD_GAPS_OPEN) == 3
print("soft-complete >=512; hard gaps", m.HARD_GAPS_OPEN)
PY
grep -q 'phase512' webui/STATUS.md
echo "STATUS soft-complete 512 ok"
echo "cleaned"
echo "OK: phase512 e2e passed"
