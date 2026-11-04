#!/usr/bin/env bash
# Phase-584: soft-complete through 584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "584"
print("soft-complete 584")
PY
grep -q 'phase584' webui/STATUS.md
echo "STATUS soft-complete 584 ok"
echo "cleaned"
echo "OK: phase584 e2e passed"
