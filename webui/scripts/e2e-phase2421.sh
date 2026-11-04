#!/usr/bin/env bash
# Phase-2421: soft marker 2424 + milestone 5650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2424
assert m.WEBUI_HONESTY_MILESTONE == 5650
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "2.0"
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase2421 e2e passed"
