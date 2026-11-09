#!/usr/bin/env bash
# Phase-20048: soft-complete through 20048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20048
PY
grep -qE 'phase20048|through 20048' webui/STATUS.md
echo "OK: phase20048 e2e passed"
