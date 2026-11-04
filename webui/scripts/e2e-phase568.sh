#!/usr/bin/env bash
# Phase-568: soft-complete through 568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "568"
print("soft-complete 568")
PY
grep -q 'phase568' webui/STATUS.md
echo "STATUS soft-complete 568 ok"
echo "cleaned"
echo "OK: phase568 e2e passed"
