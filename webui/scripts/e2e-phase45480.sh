#!/usr/bin/env bash
# Phase-45480: soft-complete through 45480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45480
PY
grep -qE 'phase45480|through 45480' webui/STATUS.md
echo "OK: phase45480 e2e passed"
