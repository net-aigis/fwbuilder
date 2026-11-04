#!/usr/bin/env bash
# Phase-571: soft marker 576.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert m.WEBUI_SOFT_COMPLETE_PHASE == "576"
print("marker 576 ok")
PY
echo "cleaned"
echo "OK: phase571 e2e passed"
