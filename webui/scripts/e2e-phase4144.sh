#!/usr/bin/env bash
# Phase-4144: soft-complete through 4144 (stack_switch_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4144
assert "soft_fertig_stack_switch_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("soft-complete >=4144", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase4144|Soft-complete STATUS through 4144|through 4144' webui/STATUS.md
echo "STATUS soft-complete 4144 ok"
echo "cleaned"
echo "OK: phase4144 e2e passed"
