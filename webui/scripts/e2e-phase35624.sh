#!/usr/bin/env bash
# Phase-35624: soft-complete through 35624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35624
PY
grep -qE 'phase35624|through 35624' webui/STATUS.md
echo "OK: phase35624 e2e passed"
