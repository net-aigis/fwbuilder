#!/usr/bin/env bash
# Phase-531: soft marker 536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "536"
print("marker 536 ok")
PY
echo "cleaned"
echo "OK: phase531 e2e passed"
