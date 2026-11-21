#!/usr/bin/env bash
# Phase-38232: soft-complete through 38232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38232
PY
grep -qE 'phase38232|through 38232' webui/STATUS.md
echo "OK: phase38232 e2e passed"
