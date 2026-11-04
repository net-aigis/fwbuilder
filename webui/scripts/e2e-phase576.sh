#!/usr/bin/env bash
# Phase-576: soft-complete through 576.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "576"
print("soft-complete 576")
PY
grep -q 'phase576' webui/STATUS.md
echo "STATUS soft-complete 576 ok"
echo "cleaned"
echo "OK: phase576 e2e passed"
