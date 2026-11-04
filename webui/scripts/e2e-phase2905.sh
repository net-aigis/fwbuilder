#!/usr/bin/env bash
# Phase-2905: expect_step_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "expect_step_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["expect_step_roster"].startswith(
    "fwbweb.expectStepRoster."
)
assert "expect_step_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "expect_step_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "expect_step_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "expect_step_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "expect_step_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 20
assert h.get("soft_fertig_session_storage_clear_key_count") >= 20
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2912
print("expect_step_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase2905 e2e passed"
