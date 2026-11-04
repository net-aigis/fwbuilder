#!/usr/bin/env bash
# Phase-2601: Soft 2600+ honesty surface still complete (honesty_export_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2600
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2."))
assert "honesty_export_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "honesty_export_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_honesty_export_roster") or {}).get("entry_count") == len(m.SOFT_FERTIG_HONESTY_EXPORT_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2608
print("Soft 2600+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase2601 e2e passed"
