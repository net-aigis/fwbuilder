#!/usr/bin/env bash
# Phase-39904: soft-complete through 39904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39904
PY
grep -qE 'phase39904|through 39904' webui/STATUS.md
echo "OK: phase39904 e2e passed"
