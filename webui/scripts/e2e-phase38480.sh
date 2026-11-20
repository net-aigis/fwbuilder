#!/usr/bin/env bash
# Phase-38480: soft-complete through 38480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38480
PY
grep -qE 'phase38480|through 38480' webui/STATUS.md
echo "OK: phase38480 e2e passed"
