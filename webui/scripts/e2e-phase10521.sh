#!/usr/bin/env bash
# Phase-10521: Soft 10520+ honesty surface still complete (ssh_auth_alt_pair_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10536
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4.", "5."))
assert "ssh_auth_alt_pair_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "ssh_auth_alt_pair_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "soft_fertig_ssh_auth_alt_pair_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_auth_alt_pair_roster") or {}).get("entry_count") == 2
print("Soft 10520+ ok")
PY
echo "cleaned"; echo "OK: phase10521 e2e passed"
