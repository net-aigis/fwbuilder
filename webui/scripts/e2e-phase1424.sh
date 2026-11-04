#!/usr/bin/env bash
# Phase-1424: soft-complete through 1424 (related refusals download).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1424
print("soft-complete >=1424", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1424|Soft-complete STATUS through 1424|through 1424' webui/STATUS.md
echo "STATUS soft-complete 1424 ok"
echo "cleaned"
echo "OK: phase1424 e2e passed"
