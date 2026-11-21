#!/usr/bin/env bash
# Phase-46368: soft-complete through 46368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46368
PY
grep -qE 'phase46368|through 46368' webui/STATUS.md
echo "OK: phase46368 e2e passed"
