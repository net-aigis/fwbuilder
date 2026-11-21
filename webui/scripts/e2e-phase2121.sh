#!/usr/bin/env bash
# Phase-2121: surface_changelog in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "surface_changelog" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["surface_changelog"].startswith(
    "fwbweb.honestySurfaceChangelog."
)
assert "surface_changelog" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "surface_changelog" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "surface_changelog" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "surface_changelog" in (h.get("soft_fertig_session_storage_keys") or {})
assert "surface_changelog" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 10
assert h.get("soft_fertig_session_storage_clear_key_count") >= 10
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2128
print("surface_changelog sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase2121 e2e passed"
