#!/usr/bin/env bash
# Phase-5241: Soft 5240+ honesty surface still complete (ssh_method_lists_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SSH_METHOD_LIST_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5248
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4.", "5."))
assert "ssh_method_lists_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "ssh_method_lists_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_ssh_method_lists_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5248
print("Soft 5240+ honesty surface ok")
PY
echo "cleaned"; echo "OK: phase5241 e2e passed"
