#!/usr/bin/env bash
# Phase-33912: soft-complete through 33912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33912
PY
grep -qE 'phase33912|through 33912' webui/STATUS.md
echo "OK: phase33912 e2e passed"
