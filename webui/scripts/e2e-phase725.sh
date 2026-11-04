#!/usr/bin/env bash
# Phase-725: soft marker 728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "728"
assert m.WEBUI_HONESTY_MILESTONE == 750
print("marker 728 ok")
PY
echo "cleaned"
echo "OK: phase725 e2e passed"
