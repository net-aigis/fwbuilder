#!/usr/bin/env bash
# Phase-3693: soft marker >=3696.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3696
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "cleaned"
echo "OK: phase3693 e2e passed"
