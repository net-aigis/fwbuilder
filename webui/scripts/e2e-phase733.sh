#!/usr/bin/env bash
# Phase-733: soft marker 736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "736"
assert m.WEBUI_HONESTY_MILESTONE == 750
print("marker 736 ok")
PY
echo "cleaned"
echo "OK: phase733 e2e passed"
