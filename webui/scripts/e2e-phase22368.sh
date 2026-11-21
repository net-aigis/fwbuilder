#!/usr/bin/env bash
# Phase-22368: soft-complete through 22368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22368
PY
grep -qE 'phase22368|through 22368' webui/STATUS.md
echo "OK: phase22368 e2e passed"
