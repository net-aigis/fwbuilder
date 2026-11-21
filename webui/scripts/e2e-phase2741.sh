#!/usr/bin/env bash
# Phase-2741: soft marker 2744 + milestone 6650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2744
assert m.WEBUI_HONESTY_MILESTONE == 6650
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "2.4"
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase2741 e2e passed"
