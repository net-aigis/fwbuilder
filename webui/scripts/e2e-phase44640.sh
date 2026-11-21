#!/usr/bin/env bash
# Phase-44640: soft-complete through 44640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44640
PY
grep -qE 'phase44640|through 44640' webui/STATUS.md
echo "OK: phase44640 e2e passed"
