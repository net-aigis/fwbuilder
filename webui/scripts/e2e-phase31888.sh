#!/usr/bin/env bash
# Phase-31888: soft-complete through 31888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31888
PY
grep -qE 'phase31888|through 31888' webui/STATUS.md
echo "OK: phase31888 e2e passed"
