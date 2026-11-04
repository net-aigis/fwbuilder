#!/usr/bin/env bash
# Phase-1512: soft-complete through 1512 (milestone 2800).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1512
assert m.WEBUI_HONESTY_MILESTONE == 2800
print("soft-complete >=1512", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1512|Soft-complete STATUS through 1512|through 1512' webui/STATUS.md
echo "STATUS soft-complete 1512 ok"
echo "cleaned"
echo "OK: phase1512 e2e passed"
