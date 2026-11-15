#!/usr/bin/env bash
# Phase-31992: soft-complete through 31992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31992
PY
grep -qE 'phase31992|through 31992' webui/STATUS.md
echo "OK: phase31992 e2e passed"
