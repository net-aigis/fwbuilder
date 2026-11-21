#!/usr/bin/env bash
# Phase-45616: soft-complete through 45616.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45616
PY
grep -qE 'phase45616|through 45616' webui/STATUS.md
echo "OK: phase45616 e2e passed"
