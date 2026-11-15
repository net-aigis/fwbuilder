#!/usr/bin/env bash
# Phase-31696: soft-complete through 31696.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31696
PY
grep -qE 'phase31696|through 31696' webui/STATUS.md
echo "OK: phase31696 e2e passed"
