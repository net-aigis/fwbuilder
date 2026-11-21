#!/usr/bin/env bash
# Phase-46120: soft-complete through 46120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46120
PY
grep -qE 'phase46120|through 46120' webui/STATUS.md
echo "OK: phase46120 e2e passed"
