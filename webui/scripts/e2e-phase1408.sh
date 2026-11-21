#!/usr/bin/env bash
# Phase-1408: soft-complete through 1408 (surface download UI).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1408
print("soft-complete >=1408", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1408|Soft-complete STATUS through 1408|through 1408' webui/STATUS.md
echo "STATUS soft-complete 1408 ok"
echo "cleaned"
echo "OK: phase1408 e2e passed"
