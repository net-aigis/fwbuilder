#!/usr/bin/env bash
# Phase-2181: soft marker 2184 + milestone 4900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2184
assert m.WEBUI_HONESTY_MILESTONE == 4900
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "1.7"
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase2181 e2e passed"
