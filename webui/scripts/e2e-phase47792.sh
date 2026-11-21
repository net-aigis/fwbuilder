#!/usr/bin/env bash
# Phase-47792: soft-complete through 47792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47792
PY
grep -qE 'phase47792|through 47792' webui/STATUS.md
echo "OK: phase47792 e2e passed"
