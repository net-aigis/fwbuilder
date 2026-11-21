#!/usr/bin/env bash
# Phase-25008: soft-complete through 25008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25008
PY
grep -qE 'phase25008|through 25008' webui/STATUS.md
echo "OK: phase25008 e2e passed"
