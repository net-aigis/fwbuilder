#!/usr/bin/env bash
# Phase-3625: surface_changelog_meta_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["surface_changelog_meta_roster"].startswith(
    "fwbweb.surfaceChangelogMetaRoster."
)
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "surface_changelog_meta_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "surface_changelog_meta_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "surface_changelog_meta_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 29
assert h.get("soft_fertig_session_storage_clear_key_count") >= 29
assert "surfaceChangelogMetaRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("surface_changelog_meta_roster") or ""
)
assert "surfaceChangelogMetaRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("surface_changelog_meta_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3632
print("surface_changelog_meta_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase3625 e2e passed"
