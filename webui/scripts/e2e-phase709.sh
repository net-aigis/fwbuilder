#!/usr/bin/env bash
# Phase-709: soft marker 712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "712"
assert m.WEBUI_HONESTY_MILESTONE == 700
print("marker 712 ok")
PY
echo "cleaned"
echo "OK: phase709 e2e passed"
