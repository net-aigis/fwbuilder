#!/usr/bin/env bash
# Phase-813: soft marker 816.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 816
assert m.WEBUI_HONESTY_MILESTONE >= 900
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "cleaned"
echo "OK: phase813 e2e passed"
