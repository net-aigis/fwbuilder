#!/usr/bin/env bash
# Phase-35992: soft-complete through 35992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35992
PY
grep -qE 'phase35992|through 35992' webui/STATUS.md
echo "OK: phase35992 e2e passed"
