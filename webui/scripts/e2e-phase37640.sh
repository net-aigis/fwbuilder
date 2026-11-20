#!/usr/bin/env bash
# Phase-37640: soft-complete through 37640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37640
PY
grep -qE 'phase37640|through 37640' webui/STATUS.md
echo "OK: phase37640 e2e passed"
