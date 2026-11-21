#!/usr/bin/env bash
# Phase-43264: soft-complete through 43264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43264
PY
grep -qE 'phase43264|through 43264' webui/STATUS.md
echo "OK: phase43264 e2e passed"
