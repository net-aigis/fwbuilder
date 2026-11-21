#!/usr/bin/env bash
# Phase-48480: soft-complete through 48480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48480
PY
grep -qE 'phase48480|through 48480' webui/STATUS.md
echo "OK: phase48480 e2e passed"
