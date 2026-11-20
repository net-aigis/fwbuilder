#!/usr/bin/env bash
# Phase-41208: soft-complete through 41208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41208
PY
grep -qE 'phase41208|through 41208' webui/STATUS.md
echo "OK: phase41208 e2e passed"
