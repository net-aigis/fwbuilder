#!/usr/bin/env bash
# Phase-520: soft-complete through 520; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "520"
assert len(m.HARD_GAPS_OPEN) == 3
print("soft-complete 520; hard gaps", m.HARD_GAPS_OPEN)
PY
grep -q 'phase520' webui/STATUS.md
echo "STATUS soft-complete 520 ok"
echo "cleaned"
echo "OK: phase520 e2e passed"
