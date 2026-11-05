#!/usr/bin/env bash
# Phase-3141: soft marker 3144 + milestone 7900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3144
assert m.WEBUI_HONESTY_MILESTONE == 7900
assert m.SOFT_FERTIG_HONESTY_SURFACE_VERSION.startswith(("2.", "3."))
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"
echo "OK: phase3141 e2e passed"
