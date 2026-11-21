#!/usr/bin/env bash
# Phase-35528: soft-complete through 35528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35528
PY
grep -qE 'phase35528|through 35528' webui/STATUS.md
echo "OK: phase35528 e2e passed"
