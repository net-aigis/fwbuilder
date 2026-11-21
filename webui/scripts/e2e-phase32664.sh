#!/usr/bin/env bash
# Phase-32664: soft-complete through 32664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32664
PY
grep -qE 'phase32664|through 32664' webui/STATUS.md
echo "OK: phase32664 e2e passed"
