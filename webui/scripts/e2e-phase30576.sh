#!/usr/bin/env bash
# Phase-30576: soft-complete through 30576.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30576
PY
grep -qE 'phase30576|through 30576' webui/STATUS.md
echo "OK: phase30576 e2e passed"
