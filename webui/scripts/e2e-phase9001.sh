#!/usr/bin/env bash
# Phase-9001: Soft 9000+ honesty surface still complete (ssh_auth_refresh_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9016
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4.", "5."))
assert "ssh_auth_refresh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "ssh_auth_refresh_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "soft_fertig_ssh_auth_refresh_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_auth_refresh_roster") or {}).get("entry_count") == 15
print("Soft 9000+ ok")
PY
echo "cleaned"; echo "OK: phase9001 e2e passed"
