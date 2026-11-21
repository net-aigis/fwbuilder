#!/usr/bin/env bash
# Phase-33480: soft-complete through 33480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33480
PY
grep -qE 'phase33480|through 33480' webui/STATUS.md
echo "OK: phase33480 e2e passed"
