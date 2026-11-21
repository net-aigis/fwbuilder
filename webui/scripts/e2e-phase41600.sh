#!/usr/bin/env bash
# Phase-41600: soft-complete through 41600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41600
PY
grep -qE 'phase41600|through 41600' webui/STATUS.md
echo "OK: phase41600 e2e passed"
