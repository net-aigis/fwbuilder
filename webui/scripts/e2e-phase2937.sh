#!/usr/bin/env bash
# Phase-2937: soft_fertig_ssh_honesty_roster on health + hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.deploy import SSH_ALTERNATIVE_NOTES, SSH_REFUSAL_PATH_NOTES
expected = len(SSH_ALTERNATIVE_NOTES) + len(SSH_REFUSAL_PATH_NOTES)
r = m.soft_fertig_ssh_honesty_roster()
assert r.get("entry_count") == expected
assert r.get("hard_gaps_remain") is True
assert len(r.get("entries") or []) == expected
assert all("id" in e and "title" in e for e in (r.get("entries") or []))
assert "soft_fertig_ssh_honesty_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_honesty_roster") or {}).get("entry_count") == expected
assert (m.health().get("soft_fertig_ssh_honesty_roster") or {}).get(
    "hard_gaps_remain"
) is True
assert "soft_fertig_ssh_honesty_roster_entry_count" in m.soft_fertig_catalog_summary()
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2944
print("ssh_honesty_roster ok")
PY
echo "cleaned"
echo "OK: phase2937 e2e passed"
