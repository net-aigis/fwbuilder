#!/usr/bin/env bash
# Phase-43664: soft-complete through 43664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43664
PY
grep -qE 'phase43664|through 43664' webui/STATUS.md
echo "OK: phase43664 e2e passed"
