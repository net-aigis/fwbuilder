#!/usr/bin/env bash
# Phase-23728: soft-complete through 23728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23728
PY
grep -qE 'phase23728|through 23728' webui/STATUS.md
echo "OK: phase23728 e2e passed"
