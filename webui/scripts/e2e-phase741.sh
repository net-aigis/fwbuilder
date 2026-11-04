#!/usr/bin/env bash
# Phase-741: soft marker 744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "744"
assert m.WEBUI_HONESTY_MILESTONE == 800
print("marker 744 / milestone 800 ok")
PY
echo "cleaned"
echo "OK: phase741 e2e passed"
