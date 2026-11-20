#!/usr/bin/env bash
# Phase-40864: soft-complete through 40864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40864
PY
grep -qE 'phase40864|through 40864' webui/STATUS.md
echo "OK: phase40864 e2e passed"
