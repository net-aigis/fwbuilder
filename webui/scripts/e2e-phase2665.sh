#!/usr/bin/env bash
# Phase-2665: honesty_bundle_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "honesty_bundle_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["honesty_bundle_roster"].startswith(
    "fwbweb.honestyBundleRoster."
)
assert "honesty_bundle_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "honesty_bundle_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "honesty_bundle_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "honesty_bundle_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "honesty_bundle_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 17
assert h.get("soft_fertig_session_storage_clear_key_count") >= 17
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2672
print("honesty_bundle_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase2665 e2e passed"
