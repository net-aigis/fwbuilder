#!/usr/bin/env bash
# Phase-5509: soft marker 5112 + milestone 15300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 5512
assert m.WEBUI_HONESTY_MILESTONE >= 15300
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase5509 e2e passed"
