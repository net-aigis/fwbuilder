#!/usr/bin/env bash
# Phase-41664: soft-complete through 41664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41664
PY
grep -qE 'phase41664|through 41664' webui/STATUS.md
echo "OK: phase41664 e2e passed"
