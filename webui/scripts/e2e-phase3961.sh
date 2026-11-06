#!/usr/bin/env bash
# Phase-3961: Soft 3960+ honesty surface still complete (res_status_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_RES_STATUS_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3960
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3."))
assert "res_status_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "res_status_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.res_status()
assert (h.get("soft_fertig_res_status_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3968
print("Soft 3960+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase3961 e2e passed"
