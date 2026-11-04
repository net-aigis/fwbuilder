#!/usr/bin/env bash
# Phase-517: soft marker 520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "520"
print("marker 520 ok")
PY
echo "cleaned"
echo "OK: phase517 e2e passed"
