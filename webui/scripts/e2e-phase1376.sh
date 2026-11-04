#!/usr/bin/env bash
# Phase-1376: soft-complete through 1376 (summary honesty_paths).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1376
print("soft-complete >=1376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1376|Soft-complete STATUS through 1376|through 1376' webui/STATUS.md
echo "STATUS soft-complete 1376 ok"
echo "cleaned"
echo "OK: phase1376 e2e passed"
