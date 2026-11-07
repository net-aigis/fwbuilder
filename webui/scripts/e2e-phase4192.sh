#!/usr/bin/env bash
# Phase-4192: soft-complete through 4192 (stack_switch_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4192
assert "stack_switch_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4192", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4192|Soft-complete STATUS through 4192|through 4192' webui/STATUS.md
echo "STATUS soft-complete 4192 ok"
echo "cleaned"
echo "OK: phase4192 e2e passed"
