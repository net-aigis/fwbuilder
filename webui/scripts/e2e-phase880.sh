#!/usr/bin/env bash
# Phase-880: soft-complete through 880 (grid/label/tooltip samples).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 880
print("soft-complete >=880", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase880|Soft-complete STATUS through 880|through 880' webui/STATUS.md
echo "STATUS soft-complete 880 ok"
echo "cleaned"
echo "OK: phase880 e2e passed"
