#!/usr/bin/env bash
# Phase-4201: Soft 4200+ honesty surface still complete (stack_switch_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_STACK_SWITCH_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4200
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "stack_switch_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "stack_switch_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_stack_switch_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4208
print("Soft 4200+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase4201 e2e passed"
