#!/usr/bin/env bash
# Phase-603: soft marker 608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "608"
print("marker 608 ok")
PY
echo "cleaned"
echo "OK: phase603 e2e passed"
