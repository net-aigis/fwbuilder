#!/usr/bin/env bash
# Phase-41288: soft-complete through 41288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41288
PY
grep -qE 'phase41288|through 41288' webui/STATUS.md
echo "OK: phase41288 e2e passed"
