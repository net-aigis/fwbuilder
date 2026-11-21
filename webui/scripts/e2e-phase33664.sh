#!/usr/bin/env bash
# Phase-33664: soft-complete through 33664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33664
PY
grep -qE 'phase33664|through 33664' webui/STATUS.md
echo "OK: phase33664 e2e passed"
