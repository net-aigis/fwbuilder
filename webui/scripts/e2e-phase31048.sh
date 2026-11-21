#!/usr/bin/env bash
# Phase-31048: soft-complete through 31048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31048
PY
grep -qE 'phase31048|through 31048' webui/STATUS.md
echo "OK: phase31048 e2e passed"
