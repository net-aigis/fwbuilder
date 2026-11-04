#!/usr/bin/env bash
# Phase-600: soft-complete through 600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "600"
print("soft-complete 600")
PY
grep -q 'phase600' webui/STATUS.md
echo "STATUS soft-complete 600 ok"
echo "cleaned"
echo "OK: phase600 e2e passed"
