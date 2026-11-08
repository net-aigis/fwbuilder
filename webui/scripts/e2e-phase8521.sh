#!/usr/bin/env bash
# Phase-8521: Soft 8520+ honesty surface still complete (ssh_implemented_agent_refresh_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8536
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4.", "5."))
assert "ssh_implemented_agent_refresh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "ssh_implemented_agent_refresh_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "soft_fertig_ssh_implemented_agent_refresh_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_implemented_agent_refresh_roster") or {}).get("entry_count") == 1
print("Soft 8520+ ok")
PY
echo "cleaned"; echo "OK: phase8521 e2e passed"
