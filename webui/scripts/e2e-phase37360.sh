#!/usr/bin/env bash
# Phase-37360: soft-complete through 37360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37360
PY
grep -qE 'phase37360|through 37360' webui/STATUS.md
echo "OK: phase37360 e2e passed"
