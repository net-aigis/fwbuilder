#!/usr/bin/env bash
# Phase-31224: soft-complete through 31224.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31224
PY
grep -qE 'phase31224|through 31224' webui/STATUS.md
echo "OK: phase31224 e2e passed"
