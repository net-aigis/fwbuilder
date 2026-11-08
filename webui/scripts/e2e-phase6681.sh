#!/usr/bin/env bash
# Phase-6681: Soft 6680+ honesty surface still complete (ssh_implemented_identity_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SSH_IMPLEMENTED_IDENTITY_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6696
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4.", "5."))
assert "ssh_implemented_identity_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "ssh_implemented_identity_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_implemented_identity_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 6696
print("Soft 6680+ honesty surface ok")
PY
echo "cleaned"; echo "OK: phase6681 e2e passed"
