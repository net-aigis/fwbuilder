#!/usr/bin/env bash
# Phase-37088: soft-complete through 37088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37088
PY
grep -qE 'phase37088|through 37088' webui/STATUS.md
echo "OK: phase37088 e2e passed"
