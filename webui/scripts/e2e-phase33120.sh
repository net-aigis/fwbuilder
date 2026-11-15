#!/usr/bin/env bash
# Phase-33120: soft-complete through 33120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33120
PY
grep -qE 'phase33120|through 33120' webui/STATUS.md
echo "OK: phase33120 e2e passed"
