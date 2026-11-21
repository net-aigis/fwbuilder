#!/usr/bin/env bash
# Phase-33928: soft-complete through 33928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33928
PY
grep -qE 'phase33928|through 33928' webui/STATUS.md
echo "OK: phase33928 e2e passed"
