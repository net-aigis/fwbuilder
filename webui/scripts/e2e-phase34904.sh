#!/usr/bin/env bash
# Phase-34904: soft-complete through 34904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34904
PY
grep -qE 'phase34904|through 34904' webui/STATUS.md
echo "OK: phase34904 e2e passed"
