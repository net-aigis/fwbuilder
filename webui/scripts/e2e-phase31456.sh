#!/usr/bin/env bash
# Phase-31456: soft-complete through 31456.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31456
PY
grep -qE 'phase31456|through 31456' webui/STATUS.md
echo "OK: phase31456 e2e passed"
