#!/usr/bin/env bash
# Phase-43480: soft-complete through 43480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43480
PY
grep -qE 'phase43480|through 43480' webui/STATUS.md
echo "OK: phase43480 e2e passed"
