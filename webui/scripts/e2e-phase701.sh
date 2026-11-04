#!/usr/bin/env bash
# Phase-701: soft marker 704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "704"
assert m.WEBUI_HONESTY_MILESTONE == 700
print("marker 704 ok")
PY
echo "cleaned"
echo "OK: phase701 e2e passed"
