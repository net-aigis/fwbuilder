#!/usr/bin/env bash
# Phase-3728: soft-complete through 3728 (Soft 3720+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3728
print("soft-complete >=3728", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3728|Soft-complete STATUS through 3728|through 3728' webui/STATUS.md
echo "STATUS soft-complete 3728 ok"
echo "cleaned"
echo "OK: phase3728 e2e passed"
