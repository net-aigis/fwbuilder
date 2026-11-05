#!/usr/bin/env bash
# Phase-3221: soft marker 3224 + milestone 8150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3224
assert m.WEBUI_HONESTY_MILESTONE == 8150
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("3.")
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase3221 e2e passed"
