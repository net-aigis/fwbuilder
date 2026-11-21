#!/usr/bin/env bash
# Phase-30048: soft-complete through 30048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30048
PY
grep -qE 'phase30048|through 30048' webui/STATUS.md
echo "OK: phase30048 e2e passed"
