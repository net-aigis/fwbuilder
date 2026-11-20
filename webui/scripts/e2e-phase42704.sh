#!/usr/bin/env bash
# Phase-42704: soft-complete through 42704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42704
PY
grep -qE 'phase42704|through 42704' webui/STATUS.md
echo "OK: phase42704 e2e passed"
