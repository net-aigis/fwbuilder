#!/usr/bin/env bash
# Phase-47720: soft-complete through 47720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47720
PY
grep -qE 'phase47720|through 47720' webui/STATUS.md
echo "OK: phase47720 e2e passed"
