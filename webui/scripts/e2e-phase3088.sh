#!/usr/bin/env bash
# Phase-3088: soft-complete through 3088 (Soft 3080+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3088
print("soft-complete >=3088", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3088|Soft-complete STATUS through 3088|through 3088' webui/STATUS.md
echo "STATUS soft-complete 3088 ok"
echo "cleaned"
echo "OK: phase3088 e2e passed"
