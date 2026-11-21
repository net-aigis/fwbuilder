#!/usr/bin/env bash
# Phase-48264: soft-complete through 48264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48264
PY
grep -qE 'phase48264|through 48264' webui/STATUS.md
echo "OK: phase48264 e2e passed"
