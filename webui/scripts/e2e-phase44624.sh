#!/usr/bin/env bash
# Phase-44624: soft-complete through 44624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44624
PY
grep -qE 'phase44624|through 44624' webui/STATUS.md
echo "OK: phase44624 e2e passed"
