#!/usr/bin/env bash
# Phase-4345: expect_run_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "expect_run_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["expect_run_roster"].startswith("fwbweb.expectRunRoster.")
assert "expect_run_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "expect_run_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "expect_run_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "expect_run_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "expect_run_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 38
assert h.get("soft_fertig_session_storage_clear_key_count") >= 38
assert "expectRunRoster" in (m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("expect_run_roster") or "")
assert "expectRunRoster" in (m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("expect_run_roster") or "")
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4352
print("expect_run_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase4345 e2e passed"
