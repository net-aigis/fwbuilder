#!/usr/bin/env bash
# Phase-14841: Soft 14840+ honesty surface still complete (ssh_auth_schema_delta_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14856
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4.", "5."))
assert "ssh_auth_schema_delta_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "ssh_auth_schema_delta_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "soft_fertig_ssh_auth_schema_delta_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_auth_schema_delta_roster") or {}).get("entry_count") == 3
print("Soft 14840+ ok")
PY
echo "cleaned"; echo "OK: phase14841 e2e passed"
