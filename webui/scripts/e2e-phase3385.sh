#!/usr/bin/env bash
# Phase-3385: honesty_readiness_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "honesty_readiness_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["honesty_readiness_roster"].startswith(
    "fwbweb.honestyReadinessRoster."
)
assert "honesty_readiness_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "honesty_readiness_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "honesty_readiness_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "honesty_readiness_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "honesty_readiness_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 26
assert h.get("soft_fertig_session_storage_clear_key_count") >= 26
assert "honestyReadinessRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("honesty_readiness_roster") or ""
)
assert "honestyReadinessRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("honesty_readiness_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3392
print("honesty_readiness_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase3385 e2e passed"
