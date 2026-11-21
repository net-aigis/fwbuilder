#!/usr/bin/env bash
# Phase-9241: Soft 9240+ honesty surface still complete (ssh_auth_bool_flag_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9256
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4.", "5."))
assert "ssh_auth_bool_flag_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "ssh_auth_bool_flag_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "soft_fertig_ssh_auth_bool_flag_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_auth_bool_flag_roster") or {}).get("entry_count") == 6
print("Soft 9240+ ok")
PY
echo "cleaned"; echo "OK: phase9241 e2e passed"
