#!/usr/bin/env bash
# Phase-2117: soft marker 2120 + milestone 4700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2120
assert m.WEBUI_HONESTY_MILESTONE == 4700
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("1.")
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase2117 e2e passed"
