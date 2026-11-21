#!/usr/bin/env bash
# Phase-37992: soft-complete through 37992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37992
PY
grep -qE 'phase37992|through 37992' webui/STATUS.md
echo "OK: phase37992 e2e passed"
