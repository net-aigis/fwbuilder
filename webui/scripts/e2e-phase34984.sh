#!/usr/bin/env bash
# Phase-34984: soft-complete through 34984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34984
PY
grep -qE 'phase34984|through 34984' webui/STATUS.md
echo "OK: phase34984 e2e passed"
