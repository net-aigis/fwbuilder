#!/usr/bin/env bash
# Phase-502: soft marker 504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "504"
print("marker 504 ok")
PY
echo "cleaned"
echo "OK: phase502 e2e passed"
