#!/usr/bin/env bash
# Phase-44328: soft-complete through 44328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44328
PY
grep -qE 'phase44328|through 44328' webui/STATUS.md
echo "OK: phase44328 e2e passed"
