#!/usr/bin/env bash
# Phase-5177: soft_fertig_ssh_method_lists_roster on hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SSH_METHOD_LIST_KEYS)
assert expected == 3
r = m.soft_fertig_ssh_method_lists_roster()
assert r.get("entry_count") == expected
assert r.get("hard_gaps_remain") is True
assert [e["id"] for e in r["entries"]] == list(m.SOFT_FERTIG_SSH_METHOD_LIST_KEYS)
assert "soft_fertig_ssh_method_lists_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_method_lists_roster") or {}).get("entry_count") == expected
assert (m.health().get("soft_fertig_ssh_method_lists_roster") or {}).get("hard_gaps_remain") is True
cs = m.soft_fertig_catalog_summary()
assert cs.get("soft_fertig_ssh_method_lists_roster_entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5184
print("ssh_method_lists_roster ok", expected)
PY
echo "cleaned"; echo "OK: phase5177 e2e passed"
