#!/usr/bin/env bash
# Phase-3561: Soft 3560+ honesty surface still complete (honesty_operator_brief_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_HONESTY_OPERATOR_BRIEF_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3560
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3."))
assert "honesty_operator_brief_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "honesty_operator_brief_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_honesty_operator_brief_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3568
print("Soft 3560+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase3561 e2e passed"
