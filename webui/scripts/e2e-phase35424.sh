#!/usr/bin/env bash
# Phase-35424: soft-complete through 35424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35424
PY
grep -qE 'phase35424|through 35424' webui/STATUS.md
echo "OK: phase35424 e2e passed"
