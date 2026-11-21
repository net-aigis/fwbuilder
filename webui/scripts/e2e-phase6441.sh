#!/usr/bin/env bash
# Phase-6441: Soft 6440+ honesty surface still complete (ssh_implemented_agent_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SSH_IMPLEMENTED_AGENT_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6456
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4.", "5."))
assert "ssh_implemented_agent_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "ssh_implemented_agent_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_implemented_agent_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6456
print("Soft 6440+ honesty surface ok")
PY
echo "cleaned"; echo "OK: phase6441 e2e passed"
