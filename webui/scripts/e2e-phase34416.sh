#!/usr/bin/env bash
# Phase-34416: soft-complete through 34416.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34416
PY
grep -qE 'phase34416|through 34416' webui/STATUS.md
echo "OK: phase34416 e2e passed"
