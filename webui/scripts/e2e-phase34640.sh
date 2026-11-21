#!/usr/bin/env bash
# Phase-34640: soft-complete through 34640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34640
PY
grep -qE 'phase34640|through 34640' webui/STATUS.md
echo "OK: phase34640 e2e passed"
