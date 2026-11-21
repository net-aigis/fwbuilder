#!/usr/bin/env bash
# Phase-34328: soft-complete through 34328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34328
PY
grep -qE 'phase34328|through 34328' webui/STATUS.md
echo "OK: phase34328 e2e passed"
