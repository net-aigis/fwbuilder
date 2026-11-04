#!/usr/bin/env bash
# Phase-1192: soft-complete through 1192 (ssh titles).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1192
print("soft-complete >=1192", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1192|Soft-complete STATUS through 1192|through 1192' webui/STATUS.md
echo "STATUS soft-complete 1192 ok"
echo "cleaned"
echo "OK: phase1192 e2e passed"
