#!/usr/bin/env bash
# Phase-4505: expect_steps_refusals_roster in sessionStorage + clear catalogs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert "expect_steps_refusals_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert m.SOFT_FERTIG_SESSION_STORAGE_KEYS["expect_steps_refusals_roster"].startswith("fwbweb.expectStepsRefusalsRoster.")
assert "expect_steps_refusals_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEY_TITLES
assert "expect_steps_refusals_roster" in m.SOFT_FERTIG_SESSION_STORAGE_NOTES
assert "expect_steps_refusals_roster" in m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS
h = m.hard_gaps()
assert "expect_steps_refusals_roster" in (h.get("soft_fertig_session_storage_keys") or {})
assert "expect_steps_refusals_roster" in (h.get("soft_fertig_session_storage_clear_keys") or [])
assert h.get("soft_fertig_session_storage_key_count") >= 40
assert h.get("soft_fertig_session_storage_clear_key_count") >= 40
assert "expectStepsRefusalsRoster" in (m.SOFT_FERTIG_HONESTY_EXPORT_NOTES.get("expect_steps_refusals_roster") or "")
assert "expectStepsRefusalsRoster" in (m.SOFT_FERTIG_HONESTY_BUNDLE_NOTES.get("expect_steps_refusals_roster") or "")
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4512
print("expect_steps_refusals_roster sessionStorage ok")
PY
echo "cleaned"
echo "OK: phase4505 e2e passed"
