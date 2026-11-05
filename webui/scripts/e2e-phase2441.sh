#!/usr/bin/env bash
# Phase-2441: Soft 2440+ honesty surface still complete (path_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2440
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3."))
assert "honesty_path_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "honesty_path_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.hard_gaps()
assert (h.get("soft_fertig_honesty_path_roster") or {}).get("entry_count") == len(m.HONESTY_PATHS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2448
print("Soft 2440+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase2441 e2e passed"
