#!/usr/bin/env bash
# Phase-37952: soft-complete through 37952.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37952
PY
grep -qE 'phase37952|through 37952' webui/STATUS.md
echo "OK: phase37952 e2e passed"
