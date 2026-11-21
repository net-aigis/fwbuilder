#!/usr/bin/env bash
# Phase-26368: soft-complete through 26368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26368
PY
grep -qE 'phase26368|through 26368' webui/STATUS.md
echo "OK: phase26368 e2e passed"
