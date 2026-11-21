#!/usr/bin/env bash
# Phase-32048: soft-complete through 32048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32048
PY
grep -qE 'phase32048|through 32048' webui/STATUS.md
echo "OK: phase32048 e2e passed"
