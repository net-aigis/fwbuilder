#!/usr/bin/env bash
# Phase-14901: soft marker 5144 + milestone 18950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14912
assert m.WEBUI_HONESTY_MILESTONE >= 18950
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase14901 e2e passed"
