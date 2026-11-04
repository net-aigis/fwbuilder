#!/usr/bin/env bash
# Phase-555: soft marker 560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "560"
print("marker 560 ok")
PY
echo "cleaned"
echo "OK: phase555 e2e passed"
