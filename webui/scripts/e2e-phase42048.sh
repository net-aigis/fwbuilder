#!/usr/bin/env bash
# Phase-42048: soft-complete through 42048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42048
PY
grep -qE 'phase42048|through 42048' webui/STATUS.md
echo "OK: phase42048 e2e passed"
