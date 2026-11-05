#!/usr/bin/env bash
# Phase-3401: Soft 3400+ honesty surface still complete (honesty_readiness_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_HONESTY_READINESS_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3400
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3."))
assert "honesty_readiness_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "honesty_readiness_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_honesty_readiness_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3408
print("Soft 3400+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase3401 e2e passed"
