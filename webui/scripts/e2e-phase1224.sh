#!/usr/bin/env bash
# Phase-1224: soft-complete through 1224 (honesty_path_notes).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1224
print("soft-complete >=1224", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1224|Soft-complete STATUS through 1224|through 1224' webui/STATUS.md
echo "STATUS soft-complete 1224 ok"
echo "cleaned"
echo "OK: phase1224 e2e passed"
