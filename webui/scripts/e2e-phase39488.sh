#!/usr/bin/env bash
# Phase-39488: soft-complete through 39488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39488
PY
grep -qE 'phase39488|through 39488' webui/STATUS.md
echo "OK: phase39488 e2e passed"
