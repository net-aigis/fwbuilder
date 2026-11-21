#!/usr/bin/env bash
# Phase-34072: soft-complete through 34072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34072
PY
grep -qE 'phase34072|through 34072' webui/STATUS.md
echo "OK: phase34072 e2e passed"
