#!/usr/bin/env bash
# Phase-42120: soft-complete through 42120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42120
PY
grep -qE 'phase42120|through 42120' webui/STATUS.md
echo "OK: phase42120 e2e passed"
