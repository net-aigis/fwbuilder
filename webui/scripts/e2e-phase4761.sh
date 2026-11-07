#!/usr/bin/env bash
# Phase-4761: Soft 4760+ honesty surface still complete (ssh_not_implemented_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SSH_NOT_IMPLEMENTED_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4760
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "ssh_not_implemented_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "ssh_not_implemented_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_not_implemented_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4768
print("Soft 4760+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase4761 e2e passed"
