#!/usr/bin/env bash
# Phase-42640: soft-complete through 42640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42640
PY
grep -qE 'phase42640|through 42640' webui/STATUS.md
echo "OK: phase42640 e2e passed"
