#!/usr/bin/env bash
# Phase-3145: layout_fidelity_sample_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "layout_fidelity_sample_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["layout_fidelity_sample_roster"].startswith(
    "fwbweb.layoutFidelitySampleRoster."
)
assert "layout_fidelity_sample_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "layout_fidelity_sample_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "layout_fidelity_sample_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "layout_fidelity_sample_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "layout_fidelity_sample_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 23
assert h.get("soft_fertig_session_storage_clear_key_count") >= 23
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3152
print("layout_fidelity_sample_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase3145 e2e passed"
