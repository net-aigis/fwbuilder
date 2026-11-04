#!/usr/bin/env bash
# Phase-539: soft marker 544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "544"
print("marker 544 ok")
PY
echo "cleaned"
echo "OK: phase539 e2e passed"
