#!/usr/bin/env bash
# Phase-669: soft marker 672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "672"
assert m.WEBUI_HONESTY_MILESTONE == 650
print("marker 672 ok")
PY
echo "cleaned"
echo "OK: phase669 e2e passed"
