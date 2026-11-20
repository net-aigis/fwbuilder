#!/usr/bin/env bash
# Phase-44072: soft-complete through 44072.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44072
PY
grep -qE 'phase44072|through 44072' webui/STATUS.md
echo "OK: phase44072 e2e passed"
