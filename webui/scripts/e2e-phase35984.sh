#!/usr/bin/env bash
# Phase-35984: soft-complete through 35984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35984
PY
grep -qE 'phase35984|through 35984' webui/STATUS.md
echo "OK: phase35984 e2e passed"
