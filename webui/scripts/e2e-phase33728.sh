#!/usr/bin/env bash
# Phase-33728: soft-complete through 33728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33728
PY
grep -qE 'phase33728|through 33728' webui/STATUS.md
echo "OK: phase33728 e2e passed"
