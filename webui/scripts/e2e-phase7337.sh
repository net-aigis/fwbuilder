#!/usr/bin/env bash
# Phase-7337: soft_fertig_ssh_refusal_path_notes_refresh_roster on hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SSH_REFUSAL_PATH_NOTES_REFRESH_KEYS)
assert expected == 2
r = m.soft_fertig_ssh_refusal_path_notes_refresh_roster()
assert r.get('entry_count') == expected
assert "soft_fertig_ssh_refusal_path_notes_refresh_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps(); cs = m.soft_fertig_catalog_summary()
assert (h.get('soft_fertig_ssh_refusal_path_notes_refresh_roster') or {}).get('entry_count')==expected
assert cs.get('soft_fertig_ssh_refusal_path_notes_refresh_roster_entry_count')==expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7352
print('ok', expected)
PY
echo "OK: phase7337 e2e passed"
