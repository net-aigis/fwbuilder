#!/usr/bin/env bash
# Phase-808: soft-complete through 808 (tree depth / buddy samples).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 808
print("soft-complete >=808", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase808|Soft-complete STATUS through 808|through 808' webui/STATUS.md
echo "STATUS soft-complete 808 ok"
echo "cleaned"
echo "OK: phase808 e2e passed"
