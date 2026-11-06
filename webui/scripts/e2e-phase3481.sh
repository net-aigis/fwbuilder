#!/usr/bin/env bash
# Phase-3481: Soft 3480+ honesty surface still complete (session_storage_clear_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_SESSION_STORAGE_CLEAR_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3480
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3."))
assert "session_storage_clear_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "session_storage_clear_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_session_storage_clear_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3488
print("Soft 3480+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase3481 e2e passed"
