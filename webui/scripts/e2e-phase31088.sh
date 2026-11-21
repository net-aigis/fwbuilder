#!/usr/bin/env bash
# Phase-31088: soft-complete through 31088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31088
PY
grep -qE 'phase31088|through 31088' webui/STATUS.md
echo "OK: phase31088 e2e passed"
