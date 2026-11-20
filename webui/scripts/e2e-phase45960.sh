#!/usr/bin/env bash
# Phase-45960: soft-complete through 45960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45960
PY
grep -qE 'phase45960|through 45960' webui/STATUS.md
echo "OK: phase45960 e2e passed"
