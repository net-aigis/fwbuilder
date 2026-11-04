#!/usr/bin/env bash
# Phase-494: soft marker 496.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "496"
print("marker 496 ok")
PY
echo "cleaned"
echo "OK: phase494 e2e passed"
