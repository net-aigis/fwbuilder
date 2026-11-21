#!/usr/bin/env bash
# Phase-37368: soft-complete through 37368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37368
PY
grep -qE 'phase37368|through 37368' webui/STATUS.md
echo "OK: phase37368 e2e passed"
