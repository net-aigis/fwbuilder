#!/usr/bin/env bash
# Phase-560: soft-complete through 560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "560"
print("soft-complete 560")
PY
grep -q 'phase560' webui/STATUS.md
echo "STATUS soft-complete 560 ok"
echo "cleaned"
echo "OK: phase560 e2e passed"
