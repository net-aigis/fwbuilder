#!/usr/bin/env bash
# Phase-2041: soft_complete_note in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "soft_complete_note" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["soft_complete_note"].startswith(
    "fwbweb.softCompleteNote."
)
assert "soft_complete_note" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "soft_complete_note" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "soft_complete_note" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "soft_complete_note" in (h.get("soft_fertig_session_storage_keys") or {})
assert "soft_complete_note" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 9
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2048
print("soft_complete_note sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase2041 e2e passed"
