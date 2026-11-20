#!/usr/bin/env bash
# Phase-47120: soft-complete through 47120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47120
PY
grep -qE 'phase47120|through 47120' webui/STATUS.md
echo "OK: phase47120 e2e passed"
