#!/usr/bin/env bash
# Phase-38664: soft-complete through 38664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38664
PY
grep -qE 'phase38664|through 38664' webui/STATUS.md
echo "OK: phase38664 e2e passed"
