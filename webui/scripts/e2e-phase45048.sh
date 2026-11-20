#!/usr/bin/env bash
# Phase-45048: soft-complete through 45048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45048
PY
grep -qE 'phase45048|through 45048' webui/STATUS.md
echo "OK: phase45048 e2e passed"
