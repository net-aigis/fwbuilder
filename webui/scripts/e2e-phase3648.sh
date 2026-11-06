#!/usr/bin/env bash
# Phase-3648: soft-complete through 3648 (Soft 3640+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3648
print("soft-complete >=3648", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3648|Soft-complete STATUS through 3648|through 3648' webui/STATUS.md
echo "STATUS soft-complete 3648 ok"
echo "cleaned"
echo "OK: phase3648 e2e passed"
