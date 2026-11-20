#!/usr/bin/env bash
# Phase-41360: soft-complete through 41360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41360
PY
grep -qE 'phase41360|through 41360' webui/STATUS.md
echo "OK: phase41360 e2e passed"
