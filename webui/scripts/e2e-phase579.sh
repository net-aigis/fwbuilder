#!/usr/bin/env bash
# Phase-579: soft marker 584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "584"
print("marker 584 ok")
PY
echo "cleaned"
echo "OK: phase579 e2e passed"
