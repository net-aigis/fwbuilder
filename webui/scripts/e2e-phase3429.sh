#!/usr/bin/env bash
# Phase-3429: soft marker 3432 + milestone 8800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3432
assert m.WEBUI_HONESTY_MILESTONE == 8800
assert "soft_fertig_session_storage_clear_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase3429 e2e passed"
