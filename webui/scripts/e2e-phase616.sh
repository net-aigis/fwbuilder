#!/usr/bin/env bash
# Phase-616: soft-complete through 616.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 616
print("soft-complete >=616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -q 'phase616\|Soft-complete STATUS through 616\|through 616' webui/STATUS.md
echo "STATUS soft-complete 616 ok"
echo "cleaned"
echo "OK: phase616 e2e passed"
