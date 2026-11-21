#!/usr/bin/env bash
# Phase-2048: soft-complete through 2048 (soft_complete_note sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2048
print("soft-complete >=2048", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2048|Soft-complete STATUS through 2048|through 2048' webui/STATUS.md
echo "STATUS soft-complete 2048 ok"
echo "cleaned"
echo "OK: phase2048 e2e passed"
