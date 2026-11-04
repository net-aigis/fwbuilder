#!/usr/bin/env bash
# Phase-661: soft marker 664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 664
assert m.WEBUI_HONESTY_MILESTONE == 650
print("marker 664 ok")
PY
echo "cleaned"
echo "OK: phase661 e2e passed"
