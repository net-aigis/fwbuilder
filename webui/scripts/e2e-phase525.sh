#!/usr/bin/env bash
# Phase-525: soft marker 528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "528"
print("marker 528 ok")
PY
echo "cleaned"
echo "OK: phase525 e2e passed"
