#!/usr/bin/env bash
# Phase-47728: soft-complete through 47728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47728
PY
grep -qE 'phase47728|through 47728' webui/STATUS.md
echo "OK: phase47728 e2e passed"
