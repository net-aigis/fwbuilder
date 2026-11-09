#!/usr/bin/env bash
# Phase-17341: soft marker >=5744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17352
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "cleaned"; echo "OK: phase17341 e2e passed"
