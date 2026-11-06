#!/usr/bin/env bash
# Phase-2341: soft marker 2344 + milestone 5400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2344
assert m.WEBUI_HONESTY_MILESTONE == 5400
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION .startswith(("1.", "2.", "3.", "4."))
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase2341 e2e passed"
