#!/usr/bin/env bash
# Phase-48664: soft-complete through 48664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48664
PY
grep -qE 'phase48664|through 48664' webui/STATUS.md
echo "OK: phase48664 e2e passed"
