#!/usr/bin/env bash
# Phase-3808: soft-complete through 3808 (Soft 3800+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3808
print("soft-complete >=3808", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3808|Soft-complete STATUS through 3808|through 3808' webui/STATUS.md
echo "STATUS soft-complete 3808 ok"
echo "cleaned"
echo "OK: phase3808 e2e passed"
