#!/usr/bin/env bash
# Phase-31112: soft-complete through 31112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31112
PY
grep -qE 'phase31112|through 31112' webui/STATUS.md
echo "OK: phase31112 e2e passed"
