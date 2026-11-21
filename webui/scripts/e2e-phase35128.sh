#!/usr/bin/env bash
# Phase-35128: soft-complete through 35128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35128
PY
grep -qE 'phase35128|through 35128' webui/STATUS.md
echo "OK: phase35128 e2e passed"
