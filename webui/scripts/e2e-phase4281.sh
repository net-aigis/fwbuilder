#!/usr/bin/env bash
# Phase-4281: Soft 4280+ honesty surface still complete (option_enable_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_OPTION_ENABLE_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4280
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "option_enable_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "option_enable_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_option_enable_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4288
print("Soft 4280+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase4281 e2e passed"
