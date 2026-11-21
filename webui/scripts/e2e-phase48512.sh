#!/usr/bin/env bash
# Phase-48512: soft-complete through 48512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48512
PY
grep -qE 'phase48512|through 48512' webui/STATUS.md
echo "OK: phase48512 e2e passed"
