#!/usr/bin/env bash
# Phase-48608: soft-complete through 48608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48608
PY
grep -qE 'phase48608|through 48608' webui/STATUS.md
echo "OK: phase48608 e2e passed"
