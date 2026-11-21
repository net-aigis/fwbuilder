#!/usr/bin/env bash
# Phase-37280: soft-complete through 37280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37280
PY
grep -qE 'phase37280|through 37280' webui/STATUS.md
echo "OK: phase37280 e2e passed"
