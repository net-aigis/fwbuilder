#!/usr/bin/env bash
# Phase-4601: Soft 4600+ honesty surface still complete (ssh_auth_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SSH_AUTH_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4600
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "ssh_auth_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "ssh_auth_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_auth_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4608
print("Soft 4600+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase4601 e2e passed"
