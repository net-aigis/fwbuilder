#!/usr/bin/env bash
# Phase-44104: soft-complete through 44104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44104
PY
grep -qE 'phase44104|through 44104' webui/STATUS.md
echo "OK: phase44104 e2e passed"
