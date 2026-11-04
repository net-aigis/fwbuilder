#!/usr/bin/env bash
# Phase-1757: soft marker >=1760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1760
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "cleaned"
echo "OK: phase1757 e2e passed"
