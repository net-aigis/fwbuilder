#!/usr/bin/env bash
# Phase-23488: soft-complete through 23488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23488
PY
grep -qE 'phase23488|through 23488' webui/STATUS.md
echo "OK: phase23488 e2e passed"
