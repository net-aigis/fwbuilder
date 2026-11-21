#!/usr/bin/env bash
# Phase-6921: Soft 6680+ honesty surface still complete (ssh_refusal_status_refresh_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SSH_REFUSAL_STATUS_REFRESH_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6936
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4.", "5."))
assert "ssh_refusal_status_refresh_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "ssh_refusal_status_refresh_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_refusal_status_refresh_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6936
print("Soft 6680+ honesty surface ok")
PY
echo "cleaned"; echo "OK: phase6921 e2e passed"
