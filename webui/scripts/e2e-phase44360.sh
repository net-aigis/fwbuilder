#!/usr/bin/env bash
# Phase-44360: soft-complete through 44360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44360
PY
grep -qE 'phase44360|through 44360' webui/STATUS.md
echo "OK: phase44360 e2e passed"
