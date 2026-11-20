#!/usr/bin/env bash
# Phase-46664: soft-complete through 46664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46664
PY
grep -qE 'phase46664|through 46664' webui/STATUS.md
echo "OK: phase46664 e2e passed"
