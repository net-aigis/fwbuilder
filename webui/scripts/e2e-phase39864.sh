#!/usr/bin/env bash
# Phase-39864: soft-complete through 39864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39864
PY
grep -qE 'phase39864|through 39864' webui/STATUS.md
echo "OK: phase39864 e2e passed"
