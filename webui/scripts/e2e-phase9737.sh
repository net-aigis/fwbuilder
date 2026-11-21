#!/usr/bin/env bash
# Phase-9737: soft_fertig_ssh_auth_title_map_roster on hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SSH_AUTH_TITLE_MAP_KEYS)
assert expected == 2
r = m.soft_fertig_ssh_auth_title_map_roster()
assert r.get('entry_count') == expected
assert "soft_fertig_ssh_auth_title_map_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps(); cs = m.soft_fertig_catalog_summary()
assert (h.get('soft_fertig_ssh_auth_title_map_roster') or {}).get('entry_count')==expected
assert cs.get('soft_fertig_ssh_auth_title_map_roster_entry_count')==expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9752
print('ok', expected)
PY
echo "OK: phase9737 e2e passed"
