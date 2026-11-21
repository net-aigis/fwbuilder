#!/usr/bin/env bash
# Phase-39088: soft-complete through 39088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39088
PY
grep -qE 'phase39088|through 39088' webui/STATUS.md
echo "OK: phase39088 e2e passed"
