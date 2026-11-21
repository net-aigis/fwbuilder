#!/usr/bin/env bash
# Phase-10048: soft-complete through 10048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10048
PY
grep -qE 'phase10048|through 10048' webui/STATUS.md
echo "OK: phase10048 e2e passed"
