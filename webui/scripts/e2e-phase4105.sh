#!/usr/bin/env bash
# Phase-4105: layout_fidelity_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "layout_fidelity_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["layout_fidelity_roster"].startswith("fwbweb.layoutFidelityRoster.")
assert "layout_fidelity_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "layout_fidelity_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "layout_fidelity_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "layout_fidelity_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "layout_fidelity_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 35
assert h.get("soft_fertig_session_storage_clear_key_count") >= 35
assert "layoutFidelityRoster" in (m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("layout_fidelity_roster") or "")
assert "layoutFidelityRoster" in (m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("layout_fidelity_roster") or "")
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4112
print("layout_fidelity_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase4105 e2e passed"
