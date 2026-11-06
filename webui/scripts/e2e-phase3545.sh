#!/usr/bin/env bash
# Phase-3545: honesty_operator_brief_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "honesty_operator_brief_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["honesty_operator_brief_roster"].startswith(
    "fwbweb.honestyOperatorBriefRoster."
)
assert "honesty_operator_brief_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "honesty_operator_brief_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "honesty_operator_brief_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "honesty_operator_brief_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "honesty_operator_brief_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 28
assert h.get("soft_fertig_session_storage_clear_key_count") >= 28
assert "honestyOperatorBriefRoster" in (
    m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("honesty_operator_brief_roster") or ""
)
assert "honestyOperatorBriefRoster" in (
    m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("honesty_operator_brief_roster") or ""
)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3552
print("honesty_operator_brief_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase3545 e2e passed"
