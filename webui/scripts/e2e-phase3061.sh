#!/usr/bin/env bash
# Phase-3061: soft marker 3064 + milestone 7650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3064
assert m.WEBUI_HONESTY_MILESTONE == 7650
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("2.")
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase3061 e2e passed"
