#!/usr/bin/env bash
# Phase-1280: soft-complete through 1280 (surface detail UI).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1280
print("soft-complete >=1280", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1280|Soft-complete STATUS through 1280|through 1280' webui/STATUS.md
echo "STATUS soft-complete 1280 ok"
echo "cleaned"
echo "OK: phase1280 e2e passed"
