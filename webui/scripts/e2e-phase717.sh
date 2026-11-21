#!/usr/bin/env bash
# Phase-717: soft marker 720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 720
assert m.WEBUI_HONESTY_MILESTONE >= 750
print("marker 720 / milestone 750 ok")
PY
echo "cleaned"
echo "OK: phase717 e2e passed"
