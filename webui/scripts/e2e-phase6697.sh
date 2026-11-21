#!/usr/bin/env bash
# Phase-6697: soft_fertig_ssh_not_implemented_keyboard_roster on hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SSH_NOT_IMPLEMENTED_KEYBOARD_KEYS)
assert expected == 1
r = m.soft_fertig_ssh_not_implemented_keyboard_roster()
assert r.get("entry_count") == expected
assert r.get("hard_gaps_remain") is True
assert [e["id"] for e in r["entries"]] == list(m.SOFT_FERTIG_SSH_NOT_IMPLEMENTED_KEYBOARD_KEYS)
assert "soft_fertig_ssh_not_implemented_keyboard_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_not_implemented_keyboard_roster") or {}).get("entry_count") == expected
assert (m.health().get("soft_fertig_ssh_not_implemented_keyboard_roster") or {}).get("hard_gaps_remain") is True
cs = m.soft_fertig_catalog_summary()
assert cs.get("soft_fertig_ssh_not_implemented_keyboard_roster_entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6712
print("ssh_not_implemented_keyboard_roster ok", expected)
PY
echo "cleaned"; echo "OK: phase6697 e2e passed"
