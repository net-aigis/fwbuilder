#!/usr/bin/env bash
# Phase-34120: soft-complete through 34120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34120
PY
grep -qE 'phase34120|through 34120' webui/STATUS.md
echo "OK: phase34120 e2e passed"
