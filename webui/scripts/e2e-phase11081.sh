#!/usr/bin/env bash
# Phase-11081: Soft 11080+ honesty surface still complete (ssh_auth_refusal_related_roster).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11096
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4.", "5."))
assert "ssh_auth_refusal_related_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "ssh_auth_refusal_related_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
assert "soft_fertig_ssh_auth_refusal_related_roster" in m.SOFT_FERTIG_SURFACE_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_auth_refusal_related_roster") or {}).get("entry_count") == 3
print("Soft 11080+ ok")
PY
echo "cleaned"; echo "OK: phase11081 e2e passed"
