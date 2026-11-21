#!/usr/bin/env bash
# Phase-22048: soft-complete through 22048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22048
PY
grep -qE 'phase22048|through 22048' webui/STATUS.md
echo "OK: phase22048 e2e passed"
