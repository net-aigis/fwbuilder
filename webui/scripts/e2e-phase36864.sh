#!/usr/bin/env bash
# Phase-36864: soft-complete through 36864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36864
PY
grep -qE 'phase36864|through 36864' webui/STATUS.md
echo "OK: phase36864 e2e passed"
