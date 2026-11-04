#!/usr/bin/env bash
# Phase-2825: changelog_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "changelog_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["changelog_roster"].startswith(
    "fwbweb.changelogRoster."
)
assert "changelog_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "changelog_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "changelog_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "changelog_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "changelog_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 19
assert h.get("soft_fertig_session_storage_clear_key_count") >= 19
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2832
print("changelog_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase2825 e2e passed"
