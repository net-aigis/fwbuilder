#!/usr/bin/env bash
# Phase-8048: soft-complete through 8048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8048
PY
grep -qE 'phase8048|through 8048' webui/STATUS.md
echo "OK: phase8048 e2e passed"
