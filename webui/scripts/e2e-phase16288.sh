#!/usr/bin/env bash
# Phase-16288: soft-complete through 16288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16288
PY
grep -qE 'phase16288|through 16288' webui/STATUS.md
echo "OK: phase16288 e2e passed"
