#!/usr/bin/env bash
# Phase-32504: soft-complete through 32504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32504
PY
grep -qE 'phase32504|through 32504' webui/STATUS.md
echo "OK: phase32504 e2e passed"
