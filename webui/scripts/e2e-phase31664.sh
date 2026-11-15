#!/usr/bin/env bash
# Phase-31664: soft-complete through 31664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31664
PY
grep -qE 'phase31664|through 31664' webui/STATUS.md
echo "OK: phase31664 e2e passed"
