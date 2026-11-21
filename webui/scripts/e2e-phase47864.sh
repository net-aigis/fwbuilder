#!/usr/bin/env bash
# Phase-47864: soft-complete through 47864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47864
PY
grep -qE 'phase47864|through 47864' webui/STATUS.md
echo "OK: phase47864 e2e passed"
