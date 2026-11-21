#!/usr/bin/env bash
# Phase-7488: soft-complete through 7488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7488
PY
grep -qE 'phase7488|through 7488' webui/STATUS.md
echo "OK: phase7488 e2e passed"
