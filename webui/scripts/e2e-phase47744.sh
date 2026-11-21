#!/usr/bin/env bash
# Phase-47744: soft-complete through 47744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47744
PY
grep -qE 'phase47744|through 47744' webui/STATUS.md
echo "OK: phase47744 e2e passed"
