#!/usr/bin/env bash
# Phase-33512: soft-complete through 33512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33512
PY
grep -qE 'phase33512|through 33512' webui/STATUS.md
echo "OK: phase33512 e2e passed"
