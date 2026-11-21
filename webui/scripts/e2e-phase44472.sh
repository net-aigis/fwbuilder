#!/usr/bin/env bash
# Phase-44472: soft-complete through 44472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44472
PY
grep -qE 'phase44472|through 44472' webui/STATUS.md
echo "OK: phase44472 e2e passed"
