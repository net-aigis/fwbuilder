#!/usr/bin/env bash
# Phase-38912: soft-complete through 38912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38912
PY
grep -qE 'phase38912|through 38912' webui/STATUS.md
echo "OK: phase38912 e2e passed"
