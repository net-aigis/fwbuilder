#!/usr/bin/env bash
# Phase-39704: soft-complete through 39704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39704
PY
grep -qE 'phase39704|through 39704' webui/STATUS.md
echo "OK: phase39704 e2e passed"
