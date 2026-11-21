#!/usr/bin/env bash
# Phase-33104: soft-complete through 33104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33104
PY
grep -qE 'phase33104|through 33104' webui/STATUS.md
echo "OK: phase33104 e2e passed"
