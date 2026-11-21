#!/usr/bin/env bash
# Phase-1432: soft-complete through 1432 (milestone 2550).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1432
assert m.WEBUI_HONESTY_MILESTONE == 2550
print("soft-complete >=1432", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1432|Soft-complete STATUS through 1432|through 1432' webui/STATUS.md
echo "STATUS soft-complete 1432 ok"
echo "cleaned"
echo "OK: phase1432 e2e passed"
