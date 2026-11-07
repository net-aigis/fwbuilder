#!/usr/bin/env bash
# Phase-4777: soft_fertig_ssh_implemented_roster on hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SSH_IMPLEMENTED_KEYS)
assert expected == 3
r = m.soft_fertig_ssh_implemented_roster()
assert r.get("entry_count") == expected
assert r.get("hard_gaps_remain") is True
assert [e["id"] for e in r["entries"]] == ["batch_mode", "identity_file", "ssh_agent"]
assert "soft_fertig_ssh_implemented_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_implemented_roster") or {}).get("entry_count") == expected
assert (m.health().get("soft_fertig_ssh_implemented_roster") or {}).get("hard_gaps_remain") is True
cs = m.soft_fertig_catalog_summary()
assert cs.get("soft_fertig_ssh_implemented_roster_entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4784
print("ssh_implemented_roster ok", expected)
PY
echo "cleaned"; echo "OK: phase4777 e2e passed"
