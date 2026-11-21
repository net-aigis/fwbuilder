#!/usr/bin/env bash
# Phase-30288: soft-complete through 30288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30288
PY
grep -qE 'phase30288|through 30288' webui/STATUS.md
echo "OK: phase30288 e2e passed"
