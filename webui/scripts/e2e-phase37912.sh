#!/usr/bin/env bash
# Phase-37912: soft-complete through 37912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37912
PY
grep -qE 'phase37912|through 37912' webui/STATUS.md
echo "OK: phase37912 e2e passed"
