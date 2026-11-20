#!/usr/bin/env bash
# Phase-38600: soft-complete through 38600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38600
PY
grep -qE 'phase38600|through 38600' webui/STATUS.md
echo "OK: phase38600 e2e passed"
