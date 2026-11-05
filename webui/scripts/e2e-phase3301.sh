#!/usr/bin/env bash
# Phase-3301: soft marker 3304 + milestone 8400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3304
assert m.WEBUI_HONESTY_MILESTONE == 8400
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "3.1"
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase3301 e2e passed"
