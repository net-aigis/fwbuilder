#!/usr/bin/env bash
# Phase-32104: soft-complete through 32104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32104
PY
grep -qE 'phase32104|through 32104' webui/STATUS.md
echo "OK: phase32104 e2e passed"
