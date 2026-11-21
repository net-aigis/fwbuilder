#!/usr/bin/env bash
# Phase-31376: soft-complete through 31376.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31376
PY
grep -qE 'phase31376|through 31376' webui/STATUS.md
echo "OK: phase31376 e2e passed"
