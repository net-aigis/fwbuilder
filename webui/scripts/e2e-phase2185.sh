#!/usr/bin/env bash
# Phase-2185: operator_brief in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "operator_brief" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["operator_brief"].startswith(
    "fwbweb.honestyOperatorBrief."
)
assert "operator_brief" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "operator_brief" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "operator_brief" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "operator_brief" in (h.get("soft_fertig_session_storage_keys") or {})
assert "operator_brief" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 11
assert h.get("soft_fertig_session_storage_clear_key_count") >= 11
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2192
print("operator_brief sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase2185 e2e passed"
