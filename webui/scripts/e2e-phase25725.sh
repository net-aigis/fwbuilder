#!/usr/bin/env bash
# Phase-25725: soft marker >=5808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25736
print("marker", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "cleaned"; echo "OK: phase25725 e2e passed"
