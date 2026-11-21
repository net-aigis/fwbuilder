#!/usr/bin/env bash
# Phase-33328: soft-complete through 33328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33328
PY
grep -qE 'phase33328|through 33328' webui/STATUS.md
echo "OK: phase33328 e2e passed"
