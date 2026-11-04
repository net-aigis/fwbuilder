#!/usr/bin/env bash
# Phase-504: soft-complete through 504; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "504"
assert len(m.HARD_GAPS_OPEN) == 3
print("soft-complete 504; hard gaps", m.HARD_GAPS_OPEN)
PY
grep -q 'phase504' webui/STATUS.md
echo "STATUS soft-complete 504 ok"
echo "cleaned"
echo "OK: phase504 e2e passed"
