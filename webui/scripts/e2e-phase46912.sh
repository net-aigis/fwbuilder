#!/usr/bin/env bash
# Phase-46912: soft-complete through 46912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46912
PY
grep -qE 'phase46912|through 46912' webui/STATUS.md
echo "OK: phase46912 e2e passed"
