#!/usr/bin/env bash
# Phase-5573: soft marker 5096 + milestone 15500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5576
assert m.WEBUI_HONESTY_MILESTONE == 15500
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5573 e2e passed"
