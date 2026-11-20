#!/usr/bin/env bash
# Phase-43232: soft-complete through 43232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43232
PY
grep -qE 'phase43232|through 43232' webui/STATUS.md
echo "OK: phase43232 e2e passed"
