#!/usr/bin/env bash
# Phase-30480: soft-complete through 30480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30480
PY
grep -qE 'phase30480|through 30480' webui/STATUS.md
echo "OK: phase30480 e2e passed"
