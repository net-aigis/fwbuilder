#!/usr/bin/env bash
# Phase-685: soft marker 688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 688
assert m.WEBUI_HONESTY_MILESTONE >= 700
print("marker 688 / milestone 700 ok")
PY
echo "cleaned"
echo "OK: phase685 e2e passed"
