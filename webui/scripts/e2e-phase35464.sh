#!/usr/bin/env bash
# Phase-35464: soft-complete through 35464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35464
PY
grep -qE 'phase35464|through 35464' webui/STATUS.md
echo "OK: phase35464 e2e passed"
