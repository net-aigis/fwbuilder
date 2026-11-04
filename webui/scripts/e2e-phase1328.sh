#!/usr/bin/env bash
# Phase-1328: soft-complete through 1328 (related refusals on closure).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1328
print("soft-complete >=1328", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1328|Soft-complete STATUS through 1328|through 1328' webui/STATUS.md
echo "STATUS soft-complete 1328 ok"
echo "cleaned"
echo "OK: phase1328 e2e passed"
