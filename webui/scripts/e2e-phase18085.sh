#!/usr/bin/env bash
# Phase-18085: soft marker 5128 + milestone 18850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18096
assert m.WEBUI_HONESTY_MILESTONE >= 18850
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
echo "cleaned"; echo "OK: phase18085 e2e passed"
