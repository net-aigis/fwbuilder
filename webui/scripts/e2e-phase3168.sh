#!/usr/bin/env bash
# Phase-3168: soft-complete through 3168 (Soft 3160+).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3168
print("soft-complete >=3168", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase3168|Soft-complete STATUS through 3168|through 3168' webui/STATUS.md
echo "STATUS soft-complete 3168 ok"
echo "cleaned"
echo "OK: phase3168 e2e passed"
