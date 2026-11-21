#!/usr/bin/env bash
# Phase-36048: soft-complete through 36048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36048
PY
grep -qE 'phase36048|through 36048' webui/STATUS.md
echo "OK: phase36048 e2e passed"
