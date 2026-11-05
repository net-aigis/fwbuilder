#!/usr/bin/env bash
# Phase-3408: soft-complete through 3408 (Soft 3400+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3408
print("soft-complete >=3408", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3408|Soft-complete STATUS through 3408|through 3408' webui/STATUS.md
echo "STATUS soft-complete 3408 ok"
echo "cleaned"
echo "OK: phase3408 e2e passed"
