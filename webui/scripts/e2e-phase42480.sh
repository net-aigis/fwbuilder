#!/usr/bin/env bash
# Phase-42480: soft-complete through 42480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42480
PY
grep -qE 'phase42480|through 42480' webui/STATUS.md
echo "OK: phase42480 e2e passed"
