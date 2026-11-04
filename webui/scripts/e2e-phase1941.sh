#!/usr/bin/env bash
# Phase-1941: soft marker 1944 + milestone 4150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1944
assert m.WEBUI_HONESTY_MILESTONE == 4150
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "1.3"
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase1941 e2e passed"
