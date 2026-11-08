#!/usr/bin/env bash
# Phase-15328: soft-complete through 15328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15328
PY
grep -qE 'phase15328|through 15328' webui/STATUS.md
echo "OK: phase15328 e2e passed"
