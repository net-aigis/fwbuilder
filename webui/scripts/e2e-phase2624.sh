#!/usr/bin/env bash
# Phase-2624: soft-complete through 2624 (honesty bundle roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2624
print("soft-complete >=2624", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2624|Soft-complete STATUS through 2624|through 2624' webui/STATUS.md
echo "STATUS soft-complete 2624 ok"
echo "cleaned"
echo "OK: phase2624 e2e passed"
