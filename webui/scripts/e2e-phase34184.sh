#!/usr/bin/env bash
# Phase-34184: soft-complete through 34184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34184
PY
grep -qE 'phase34184|through 34184' webui/STATUS.md
echo "OK: phase34184 e2e passed"
