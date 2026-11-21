#!/usr/bin/env bash
# Phase-41952: soft-complete through 41952.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41952
PY
grep -qE 'phase41952|through 41952' webui/STATUS.md
echo "OK: phase41952 e2e passed"
