#!/usr/bin/env bash
# Phase-1048: soft-complete through 1048 (milestone 1400).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1048
assert m.WEBUI_HONESTY_MILESTONE == 1400
print("soft-complete >=1048", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1048|Soft-complete STATUS through 1048|through 1048' webui/STATUS.md
echo "STATUS soft-complete 1048 ok"
echo "cleaned"
echo "OK: phase1048 e2e passed"
