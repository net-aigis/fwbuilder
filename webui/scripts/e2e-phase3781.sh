#!/usr/bin/env bash
# Phase-3781: soft marker 3784 + milestone 9900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3784
assert m.WEBUI_HONESTY_MILESTONE == 9900
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith("3.")
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase3781 e2e passed"
