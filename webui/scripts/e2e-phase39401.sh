#!/usr/bin/env bash
# Phase-39401: Soft 39400+ honesty surface still complete (ssh_auth_soft_41200_echo_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39416
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4.", "5."))
assert "ssh_auth_soft_41200_echo_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "ssh_auth_soft_41200_echo_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "soft_fertig_ssh_auth_soft_41200_echo_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_auth_soft_41200_echo_roster") or {}).get("entry_count") == 3
print("Soft 39400+ ok")
PY
echo "cleaned"; echo "OK: phase39401 e2e passed"
