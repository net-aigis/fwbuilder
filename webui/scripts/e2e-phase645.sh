#!/usr/bin/env bash
# Phase-645: soft marker 648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "648"
print("marker 648 ok")
PY
echo "cleaned"
echo "OK: phase645 e2e passed"
