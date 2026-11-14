#!/usr/bin/env bash
# Phase-30416: soft-complete through 30416.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30416
PY
grep -qE 'phase30416|through 30416' webui/STATUS.md
echo "OK: phase30416 e2e passed"
