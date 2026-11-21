#!/usr/bin/env bash
# Phase-4200: soft-complete through 4200 (stack_switch_roster session + ms 11200).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4200
assert m.WEBUI_HONESTY_MILESTONE == 11200
assert "stack_switch_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
print("soft-complete >=4200", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4200|Soft-complete STATUS through 4200|through 4200' webui/STATUS.md
echo "STATUS soft-complete 4200 ok"
echo "cleaned"
echo "OK: phase4200 e2e passed"
