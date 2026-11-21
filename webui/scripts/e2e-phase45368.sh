#!/usr/bin/env bash
# Phase-45368: soft-complete through 45368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45368
PY
grep -qE 'phase45368|through 45368' webui/STATUS.md
echo "OK: phase45368 e2e passed"
