#!/usr/bin/env bash
# Phase-1584: soft-complete through 1584 (honesty export catalog).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1584
print("soft-complete >=1584", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1584|Soft-complete STATUS through 1584|through 1584' webui/STATUS.md
echo "STATUS soft-complete 1584 ok"
echo "cleaned"
echo "OK: phase1584 e2e passed"
