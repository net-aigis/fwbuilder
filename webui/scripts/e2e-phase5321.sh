#!/usr/bin/env bash
# Phase-5321: Soft 5320+ honesty surface still complete (ssh_auth_policy_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SSH_AUTH_POLICY_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5328
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4.", "5."))
assert "ssh_auth_policy_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "ssh_auth_policy_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_auth_policy_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5328
print("Soft 5320+ honesty surface ok")
PY
echo "cleaned"; echo "OK: phase5321 e2e passed"
