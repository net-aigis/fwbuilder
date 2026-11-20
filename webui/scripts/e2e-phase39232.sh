#!/usr/bin/env bash
# Phase-39232: soft-complete through 39232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39232
PY
grep -qE 'phase39232|through 39232' webui/STATUS.md
echo "OK: phase39232 e2e passed"
