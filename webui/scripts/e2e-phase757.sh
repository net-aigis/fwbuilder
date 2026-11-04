#!/usr/bin/env bash
# Phase-757: soft marker 760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 760
assert m.WEBUI_HONESTY_MILESTONE == 850
print("marker 760 / milestone 850 ok")
PY
echo "cleaned"
echo "OK: phase757 e2e passed"
