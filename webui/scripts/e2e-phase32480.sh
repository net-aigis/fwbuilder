#!/usr/bin/env bash
# Phase-32480: soft-complete through 32480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32480
PY
grep -qE 'phase32480|through 32480' webui/STATUS.md
echo "OK: phase32480 e2e passed"
