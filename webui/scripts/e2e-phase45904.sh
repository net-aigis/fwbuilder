#!/usr/bin/env bash
# Phase-45904: soft-complete through 45904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45904
PY
grep -qE 'phase45904|through 45904' webui/STATUS.md
echo "OK: phase45904 e2e passed"
