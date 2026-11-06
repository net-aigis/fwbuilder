#!/usr/bin/env bash
# Phase-2681: Soft 2680+ honesty surface still complete (honesty_bundle_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2680
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3.", "4."))
assert "honesty_bundle_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "honesty_bundle_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_honesty_bundle_roster") or {}).get("entry_count") == len(m.SOFT_FERTIG_HONESTY_BUNDLE_SECTIONS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2688
print("Soft 2680+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase2681 e2e passed"
