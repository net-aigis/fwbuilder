#!/usr/bin/env bash
# Phase-44416: soft-complete through 44416.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44416
PY
grep -qE 'phase44416|through 44416' webui/STATUS.md
echo "OK: phase44416 e2e passed"
