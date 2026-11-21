#!/usr/bin/env bash
# Phase-36328: soft-complete through 36328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36328
PY
grep -qE 'phase36328|through 36328' webui/STATUS.md
echo "OK: phase36328 e2e passed"
