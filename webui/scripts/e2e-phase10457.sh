#!/usr/bin/env bash
# Phase-10457: soft_fertig_ssh_auth_alt_pair_roster on hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SSH_AUTH_ALT_PAIR_KEYS)
assert expected == 2
r = m.soft_fertig_ssh_auth_alt_pair_roster()
assert r.get('entry_count') == expected
assert "soft_fertig_ssh_auth_alt_pair_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps(); cs = m.soft_fertig_catalog_summary()
assert (h.get('soft_fertig_ssh_auth_alt_pair_roster') or {}).get('entry_count')==expected
assert cs.get('soft_fertig_ssh_auth_alt_pair_roster_entry_count')==expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10472
print('ok', expected)
PY
echo "OK: phase10457 e2e passed"
