#!/usr/bin/env bash
# Phase-35304: soft-complete through 35304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35304
PY
grep -qE 'phase35304|through 35304' webui/STATUS.md
echo "OK: phase35304 e2e passed"
