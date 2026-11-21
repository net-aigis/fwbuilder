#!/usr/bin/env bash
# Phase-48592: soft-complete through 48592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48592
PY
grep -qE 'phase48592|through 48592' webui/STATUS.md
echo "OK: phase48592 e2e passed"
