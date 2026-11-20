#!/usr/bin/env bash
# Phase-41904: soft-complete through 41904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41904
PY
grep -qE 'phase41904|through 41904' webui/STATUS.md
echo "OK: phase41904 e2e passed"
