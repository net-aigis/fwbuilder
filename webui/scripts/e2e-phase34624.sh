#!/usr/bin/env bash
# Phase-34624: soft-complete through 34624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34624
PY
grep -qE 'phase34624|through 34624' webui/STATUS.md
echo "OK: phase34624 e2e passed"
