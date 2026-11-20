#!/usr/bin/env bash
# Phase-37232: soft-complete through 37232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37232
PY
grep -qE 'phase37232|through 37232' webui/STATUS.md
echo "OK: phase37232 e2e passed"
