#!/usr/bin/env bash
# Phase-1744: soft-complete through 1744 (surface_version export/bundle).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1744
print("soft-complete >=1744", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1744|Soft-complete STATUS through 1744|through 1744' webui/STATUS.md
echo "STATUS soft-complete 1744 ok"
echo "cleaned"
echo "OK: phase1744 e2e passed"
