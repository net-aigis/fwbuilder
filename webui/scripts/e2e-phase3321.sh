#!/usr/bin/env bash
# Phase-3321: Soft 3320+ honesty surface still complete (catalog_summary_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_CATALOG_SUMMARY_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3320
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3."))
assert "catalog_summary_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "catalog_summary_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_catalog_summary_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3328
print("Soft 3320+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase3321 e2e passed"
