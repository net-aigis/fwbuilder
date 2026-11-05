#!/usr/bin/env bash
# Phase-3225: layout_fidelity_sample_field_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "layout_fidelity_sample_field_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["layout_fidelity_sample_field_roster"].startswith(
    "fwbweb.layoutFidelitySampleFieldRoster."
)
assert "layout_fidelity_sample_field_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "layout_fidelity_sample_field_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "layout_fidelity_sample_field_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "layout_fidelity_sample_field_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "layout_fidelity_sample_field_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 24
assert h.get("soft_fertig_session_storage_clear_key_count") >= 24
assert "layoutFidelitySampleFieldRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("layout_fidelity_sample_field_roster") or ""
)
assert "layoutFidelitySampleFieldRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("layout_fidelity_sample_field_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3232
print("layout_fidelity_sample_field_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase3225 e2e passed"
