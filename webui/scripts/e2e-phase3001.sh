#!/usr/bin/env bash
# Phase-3001: Soft 3000+ honesty surface still complete (ssh_honesty_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
from fwbweb_api.deploy import SSH_ALTERNATIVE_NOTES, SSH_REFUSAL_PATH_NOTES
expected = len(SSH_ALTERNATIVE_NOTES) + len(SSH_REFUSAL_PATH_NOTES)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3000
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "ssh_honesty_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "ssh_honesty_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_honesty_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3008
print("Soft 3000+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase3001 e2e passed"
