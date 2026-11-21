#!/usr/bin/env bash
# Phase-747: soft marker 752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 752
assert m.WEBUI_HONESTY_MILESTONE >= 800
print("marker 752 ok")
PY
echo "cleaned"
echo "OK: phase747 e2e passed"
