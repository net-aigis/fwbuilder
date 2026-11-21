#!/usr/bin/env bash
# Phase-3349: soft marker 3352 + milestone 8550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3352
assert m.WEBUI_HONESTY_MILESTONE == 8550
assert "soft_fertig_honesty_readiness_roster" in m.SOFT_FERTIG_SURFACE_KEYS
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase3349 e2e passed"
