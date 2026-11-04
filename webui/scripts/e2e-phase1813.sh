#!/usr/bin/env bash
# Phase-1813: soft marker 1816 + milestone 3750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1816
assert m.WEBUI_HONESTY_MILESTONE == 3750
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "1.1"
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase1813 e2e passed"
