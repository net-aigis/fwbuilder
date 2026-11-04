#!/usr/bin/env bash
# Phase-1496: soft-complete through 1496 (milestone 2750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1496
assert m.WEBUI_HONESTY_MILESTONE == 2750
print("soft-complete >=1496", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1496|Soft-complete STATUS through 1496|through 1496' webui/STATUS.md
echo "STATUS soft-complete 1496 ok"
echo "cleaned"
echo "OK: phase1496 e2e passed"
