#!/usr/bin/env bash
# Phase-2521: Soft 2520+ honesty surface still complete (session_storage_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2520
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "session_storage_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "session_storage_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_session_storage_roster") or {}).get("entry_count") == len(m.SOFT_FERTIG_SESSION_STORAGE_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2528
print("Soft 2520+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase2521 e2e passed"
