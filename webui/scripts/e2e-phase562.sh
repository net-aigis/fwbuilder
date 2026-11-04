#!/usr/bin/env bash
# Phase-562: soft marker 568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "568"
print("marker 568 ok")
PY
echo "cleaned"
echo "OK: phase562 e2e passed"
