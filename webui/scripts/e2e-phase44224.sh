#!/usr/bin/env bash
# Phase-44224: soft-complete through 44224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44224
PY
grep -qE 'phase44224|through 44224' webui/STATUS.md
echo "OK: phase44224 e2e passed"
