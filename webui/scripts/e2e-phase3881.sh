#!/usr/bin/env bash
# Phase-3881: Soft 3880+ honesty surface still complete (health_roster session).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
expected = len(m.SOFT_FERTIG_HEALTH_KEYS)
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3880
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("1.", "2.", "3."))
assert "health_roster" in m.SOFT_FERTIG_SESSION_STORAGE_KEYS
assert "health_roster" in m.SOFT_FERTIG_HONESTY_EXPORT_KEYS
h = m.health()
assert (h.get("soft_fertig_health_roster") or {}).get("entry_count") == expected
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3888
print("Soft 3880+ honesty surface ok")
PY
echo "cleaned"
echo "OK: phase3881 e2e passed"
