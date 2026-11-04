#!/usr/bin/env bash
# Phase-2361: Soft 2360+ honesty surface still complete (refusal_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2360
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("1.")
assert "hard_gap_refusal_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "hard_gap_refusal_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_hard_gap_refusal_roster") or {}).get("hard_gap_count") == 3
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2368
print("Soft 2360+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase2361 e2e passed"
