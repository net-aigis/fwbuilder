#!/usr/bin/env bash
# Phase-2761: Soft 2760+ honesty surface still complete (surface_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2760
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "surface_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "surface_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_surface_roster") or {}).get("entry_count") == len(m.SOFT_FERTIG_SURFACE_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2768
print("Soft 2760+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase2761 e2e passed"
