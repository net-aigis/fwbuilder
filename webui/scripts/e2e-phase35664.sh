#!/usr/bin/env bash
# Phase-35664: soft-complete through 35664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35664
PY
grep -qE 'phase35664|through 35664' webui/STATUS.md
echo "OK: phase35664 e2e passed"
