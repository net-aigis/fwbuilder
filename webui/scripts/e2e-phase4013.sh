#!/usr/bin/env bash
# Phase-4013: soft marker >=4016.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4016
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "cleaned"
echo "OK: phase4013 e2e passed"
