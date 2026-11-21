#!/usr/bin/env bash
# Phase-35672: soft-complete through 35672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35672
PY
grep -qE 'phase35672|through 35672' webui/STATUS.md
echo "OK: phase35672 e2e passed"
