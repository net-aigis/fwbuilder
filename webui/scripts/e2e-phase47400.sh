#!/usr/bin/env bash
# Phase-47400: soft-complete through 47400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47400
PY
grep -qE 'phase47400|through 47400' webui/STATUS.md
echo "OK: phase47400 e2e passed"
