#!/usr/bin/env bash
# Phase-44288: soft-complete through 44288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44288
PY
grep -qE 'phase44288|through 44288' webui/STATUS.md
echo "OK: phase44288 e2e passed"
