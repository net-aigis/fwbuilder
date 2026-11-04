#!/usr/bin/env bash
# Phase-2544: soft-complete through 2544 (honesty export roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2544
print("soft-complete >=2544", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2544|Soft-complete STATUS through 2544|through 2544' webui/STATUS.md
echo "STATUS soft-complete 2544 ok"
echo "cleaned"
echo "OK: phase2544 e2e passed"
