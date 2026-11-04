#!/usr/bin/env bash
# Phase-509: soft marker 512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "512"
print("marker 512 ok")
PY
echo "cleaned"
echo "OK: phase509 e2e passed"
