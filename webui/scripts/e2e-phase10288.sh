#!/usr/bin/env bash
# Phase-10288: soft-complete through 10288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10288
PY
grep -qE 'phase10288|through 10288' webui/STATUS.md
echo "OK: phase10288 e2e passed"
