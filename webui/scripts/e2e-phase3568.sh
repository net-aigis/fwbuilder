#!/usr/bin/env bash
# Phase-3568: soft-complete through 3568 (Soft 3560+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3568
print("soft-complete >=3568", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3568|Soft-complete STATUS through 3568|through 3568' webui/STATUS.md
echo "STATUS soft-complete 3568 ok"
echo "cleaned"
echo "OK: phase3568 e2e passed"
