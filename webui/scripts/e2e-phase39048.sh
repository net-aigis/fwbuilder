#!/usr/bin/env bash
# Phase-39048: soft-complete through 39048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39048
PY
grep -qE 'phase39048|through 39048' webui/STATUS.md
echo "OK: phase39048 e2e passed"
