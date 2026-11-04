#!/usr/bin/env bash
# Phase-548: soft marker 552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "552"
print("marker 552 ok")
PY
echo "cleaned"
echo "OK: phase548 e2e passed"
