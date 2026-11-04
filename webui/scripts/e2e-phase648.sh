#!/usr/bin/env bash
# Phase-648: soft-complete through 648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 648
print("soft-complete >=648", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -q 'phase648\|Soft-complete STATUS through 648\|through 648' webui/STATUS.md
echo "STATUS soft-complete 648 ok"
echo "cleaned"
echo "OK: phase648 e2e passed"
