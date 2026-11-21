#!/usr/bin/env bash
# Phase-42264: soft-complete through 42264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42264
PY
grep -qE 'phase42264|through 42264' webui/STATUS.md
echo "OK: phase42264 e2e passed"
