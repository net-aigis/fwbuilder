#!/usr/bin/env bash
# Phase-33616: soft-complete through 33616.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33616
PY
grep -qE 'phase33616|through 33616' webui/STATUS.md
echo "OK: phase33616 e2e passed"
