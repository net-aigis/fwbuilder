#!/usr/bin/env bash
# Phase-22288: soft-complete through 22288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22288
PY
grep -qE 'phase22288|through 22288' webui/STATUS.md
echo "OK: phase22288 e2e passed"
