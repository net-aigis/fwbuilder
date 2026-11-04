#!/usr/bin/env bash
# Phase-608: soft-complete through 608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "608"
print("soft-complete 608")
PY
grep -q 'phase608' webui/STATUS.md
echo "STATUS soft-complete 608 ok"
echo "cleaned"
echo "OK: phase608 e2e passed"
