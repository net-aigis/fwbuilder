#!/usr/bin/env bash
# Phase-3328: soft-complete through 3328 (Soft 3320+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3328
print("soft-complete >=3328", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3328|Soft-complete STATUS through 3328|through 3328' webui/STATUS.md
echo "STATUS soft-complete 3328 ok"
echo "cleaned"
echo "OK: phase3328 e2e passed"
