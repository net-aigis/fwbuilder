#!/usr/bin/env bash
# Phase-3081: Soft 3080+ honesty surface still complete (layout_fidelity_signal_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = sum(len(v) for v in m.SOFT_FERTIG_LAYOUT_FIDELITY_SIGNAL_GROUPS.values())
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3080
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3."))
assert "layout_fidelity_signal_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "layout_fidelity_signal_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_layout_fidelity_signal_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3088
print("Soft 3080+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase3081 e2e passed"
