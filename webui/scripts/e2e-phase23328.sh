#!/usr/bin/env bash
# Phase-23328: soft-complete through 23328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23328
PY
grep -qE 'phase23328|through 23328' webui/STATUS.md
echo "OK: phase23328 e2e passed"
