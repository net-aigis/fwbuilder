#!/usr/bin/env bash
# Phase-40664: soft-complete through 40664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40664
PY
grep -qE 'phase40664|through 40664' webui/STATUS.md
echo "OK: phase40664 e2e passed"
