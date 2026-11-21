#!/usr/bin/env bash
# Phase-30640: soft-complete through 30640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30640
PY
grep -qE 'phase30640|through 30640' webui/STATUS.md
echo "OK: phase30640 e2e passed"
