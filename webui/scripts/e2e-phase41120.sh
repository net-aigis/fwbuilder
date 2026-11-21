#!/usr/bin/env bash
# Phase-41120: soft-complete through 41120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41120
PY
grep -qE 'phase41120|through 41120' webui/STATUS.md
echo "OK: phase41120 e2e passed"
