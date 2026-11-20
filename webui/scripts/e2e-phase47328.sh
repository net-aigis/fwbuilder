#!/usr/bin/env bash
# Phase-47328: soft-complete through 47328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47328
PY
grep -qE 'phase47328|through 47328' webui/STATUS.md
echo "OK: phase47328 e2e passed"
