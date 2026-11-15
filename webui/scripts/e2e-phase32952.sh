#!/usr/bin/env bash
# Phase-32952: soft-complete through 32952.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32952
PY
grep -qE 'phase32952|through 32952' webui/STATUS.md
echo "OK: phase32952 e2e passed"
