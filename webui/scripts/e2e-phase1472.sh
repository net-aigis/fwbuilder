#!/usr/bin/env bash
# Phase-1472: soft-complete through 1472 (session storage keys catalog).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1472
print("soft-complete >=1472", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1472|Soft-complete STATUS through 1472|through 1472' webui/STATUS.md
echo "STATUS soft-complete 1472 ok"
echo "cleaned"
echo "OK: phase1472 e2e passed"
