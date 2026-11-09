#!/usr/bin/env bash
# Phase-17817: soft_fertig_ssh_auth_undeca_checkpoint_roster on hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SSH_AUTH_UNDECA_CHECKPOINT_KEYS)
assert expected == 11
r = m.soft_fertig_ssh_auth_undeca_checkpoint_roster()
assert r.get('entry_count') == expected
assert "soft_fertig_ssh_auth_undeca_checkpoint_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps(); cs = m.soft_fertig_catalog_summary()
assert (h.get('soft_fertig_ssh_auth_undeca_checkpoint_roster') or {}).get('entry_count')==expected
assert cs.get('soft_fertig_ssh_auth_undeca_checkpoint_roster_entry_count')==expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17832
print('ok', expected)
PY
echo "OK: phase17817 e2e passed"
