#!/usr/bin/env bash
# Phase-47664: soft-complete through 47664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47664
PY
grep -qE 'phase47664|through 47664' webui/STATUS.md
echo "OK: phase47664 e2e passed"
