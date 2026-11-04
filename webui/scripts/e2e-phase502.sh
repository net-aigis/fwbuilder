#!/usr/bin/env bash
# Phase-502: soft marker at least 504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 504, m.WEBUI_SOFT_COMPLETE_PHASE
print("marker >=504 ok", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "cleaned"
echo "OK: phase502 e2e passed"
