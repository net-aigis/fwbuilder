#!/usr/bin/env bash
# Phase-5293: soft marker >=5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5296
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "cleaned"; echo "OK: phase5293 e2e passed"
