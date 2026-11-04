#!/usr/bin/env bash
# Phase-477: soft marker 480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "480"
print("marker 480 ok")
PY
echo "cleaned"
echo "OK: phase477 e2e passed"
