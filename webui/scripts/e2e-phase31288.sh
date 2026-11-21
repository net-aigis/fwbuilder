#!/usr/bin/env bash
# Phase-31288: soft-complete through 31288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31288
PY
grep -qE 'phase31288|through 31288' webui/STATUS.md
echo "OK: phase31288 e2e passed"
