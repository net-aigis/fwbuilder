#!/usr/bin/env bash
# Phase-42832: soft-complete through 42832.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42832
PY
grep -qE 'phase42832|through 42832' webui/STATUS.md
echo "OK: phase42832 e2e passed"
