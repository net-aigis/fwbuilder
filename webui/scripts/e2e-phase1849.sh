#!/usr/bin/env bash
# Phase-1849: track_note in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "track_note" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["track_note"].startswith(
    "fwbweb.honestyTrackNote."
)
assert "track_note" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "track_note" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "track_note" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "track_note" in (h.get("soft_fertig_session_storage_keys") or {})
assert "track_note" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 7
assert h.get("soft_fertig_session_storage_clear_key_count") >= 7
s = m.soft_fertig_catalog_summary()
assert int(s["soft_fertig_session_storage_key_count"]) >= 7
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1856
print("track_note sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase1849 e2e passed"
