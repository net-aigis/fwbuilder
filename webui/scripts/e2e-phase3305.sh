#!/usr/bin/env bash
# Phase-3305: catalog_summary_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "catalog_summary_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["catalog_summary_roster"].startswith(
    "fwbweb.catalogSummaryRoster."
)
assert "catalog_summary_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "catalog_summary_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "catalog_summary_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "catalog_summary_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "catalog_summary_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 25
assert h.get("soft_fertig_session_storage_clear_key_count") >= 25
assert "catalogSummaryRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("catalog_summary_roster") or ""
)
assert "catalogSummaryRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("catalog_summary_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3312
print("catalog_summary_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase3305 e2e passed"
