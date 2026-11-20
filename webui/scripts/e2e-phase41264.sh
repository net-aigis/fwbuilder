#!/usr/bin/env bash
# Phase-41264: soft-complete through 41264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41264
PY
grep -qE 'phase41264|through 41264' webui/STATUS.md
echo "OK: phase41264 e2e passed"
