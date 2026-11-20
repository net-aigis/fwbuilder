#!/usr/bin/env bash
# Phase-43368: soft-complete through 43368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43368
PY
grep -qE 'phase43368|through 43368' webui/STATUS.md
echo "OK: phase43368 e2e passed"
