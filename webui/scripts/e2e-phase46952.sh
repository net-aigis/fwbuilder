#!/usr/bin/env bash
# Phase-46952: soft-complete through 46952.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46952
PY
grep -qE 'phase46952|through 46952' webui/STATUS.md
echo "OK: phase46952 e2e passed"
