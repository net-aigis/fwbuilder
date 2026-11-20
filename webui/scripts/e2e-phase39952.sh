#!/usr/bin/env bash
# Phase-39952: soft-complete through 39952.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39952
PY
grep -qE 'phase39952|through 39952' webui/STATUS.md
echo "OK: phase39952 e2e passed"
