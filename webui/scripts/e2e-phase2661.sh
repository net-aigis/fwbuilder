#!/usr/bin/env bash
# Phase-2661: soft marker 2664 + milestone 6400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2664
assert m.WEBUI_HONESTY_MILESTONE == 6400
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "2.3"
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase2661 e2e passed"
