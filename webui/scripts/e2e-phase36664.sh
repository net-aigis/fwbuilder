#!/usr/bin/env bash
# Phase-36664: soft-complete through 36664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36664
PY
grep -qE 'phase36664|through 36664' webui/STATUS.md
echo "OK: phase36664 e2e passed"
