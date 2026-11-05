#!/usr/bin/env bash
# Phase-2201: Soft 2200+ honesty surface still complete (operator_brief session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2200
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3."))
assert "operator_brief" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "operator_brief" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_honesty_operator_brief") or {}).get("hard_gap_count") == 3
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2208
print("Soft 2200+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase2201 e2e passed"
