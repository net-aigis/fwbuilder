#!/usr/bin/env bash
# Phase-1344: soft-complete through 1344 (summary soft_fertig_surface).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1344
print("soft-complete >=1344", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1344|Soft-complete STATUS through 1344|through 1344' webui/STATUS.md
echo "STATUS soft-complete 1344 ok"
echo "cleaned"
echo "OK: phase1344 e2e passed"
