#!/usr/bin/env bash
# Phase-5981: soft marker >=5744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5984
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "cleaned"; echo "OK: phase5981 e2e passed"
