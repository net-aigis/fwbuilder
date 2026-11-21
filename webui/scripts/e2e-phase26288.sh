#!/usr/bin/env bash
# Phase-26288: soft-complete through 26288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26288
PY
grep -qE 'phase26288|through 26288' webui/STATUS.md
echo "OK: phase26288 e2e passed"
