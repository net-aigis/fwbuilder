#!/usr/bin/env bash
# Phase-4121: Soft 4120+ honesty surface still complete (layout_fidelity_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_LAYOUT_FIDELITY_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4120
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "layout_fidelity_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "layout_fidelity_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_layout_fidelity_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4128
print("Soft 4120+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase4121 e2e passed"
