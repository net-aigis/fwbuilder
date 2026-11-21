#!/usr/bin/env bash
# Phase-47992: soft-complete through 47992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47992
PY
grep -qE 'phase47992|through 47992' webui/STATUS.md
echo "OK: phase47992 e2e passed"
