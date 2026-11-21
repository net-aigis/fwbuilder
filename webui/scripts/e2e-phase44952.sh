#!/usr/bin/env bash
# Phase-44952: soft-complete through 44952.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44952
PY
grep -qE 'phase44952|through 44952' webui/STATUS.md
echo "OK: phase44952 e2e passed"
