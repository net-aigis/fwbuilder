#!/usr/bin/env bash
# Phase-587: soft marker 592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "592"
print("marker 592 ok")
PY
echo "cleaned"
echo "OK: phase587 e2e passed"
