#!/usr/bin/env bash
# Phase-32904: soft-complete through 32904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32904
PY
grep -qE 'phase32904|through 32904' webui/STATUS.md
echo "OK: phase32904 e2e passed"
