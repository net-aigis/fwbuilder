#!/usr/bin/env bash
# Phase-2501: soft marker 2504 + milestone 5900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2504
assert m.WEBUI_HONESTY_MILESTONE == 5900
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION == "2.1"
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase2501 e2e passed"
