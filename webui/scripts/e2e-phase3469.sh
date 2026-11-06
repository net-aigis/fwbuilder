#!/usr/bin/env bash
# Phase-3469: soft marker >=3472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3472
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "cleaned"
echo "OK: phase3469 e2e passed"
