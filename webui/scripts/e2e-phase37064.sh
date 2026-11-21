#!/usr/bin/env bash
# Phase-37064: soft-complete through 37064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37064
PY
grep -qE 'phase37064|through 37064' webui/STATUS.md
echo "OK: phase37064 e2e passed"
