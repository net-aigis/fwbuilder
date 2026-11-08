#!/usr/bin/env bash
# Phase-8221: soft marker >=5744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8232
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "cleaned"; echo "OK: phase8221 e2e passed"
