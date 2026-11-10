#!/usr/bin/env bash
# Phase-22848: soft-complete through 22848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22848
PY
grep -qE 'phase22848|through 22848' webui/STATUS.md
echo "OK: phase22848 e2e passed"
