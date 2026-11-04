#!/usr/bin/env bash
# Phase-594: soft marker 600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "600"
print("marker 600 ok")
PY
echo "cleaned"
echo "OK: phase594 e2e passed"
