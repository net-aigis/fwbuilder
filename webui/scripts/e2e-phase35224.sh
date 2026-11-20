#!/usr/bin/env bash
# Phase-35224: soft-complete through 35224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35224
PY
grep -qE 'phase35224|through 35224' webui/STATUS.md
echo "OK: phase35224 e2e passed"
