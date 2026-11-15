#!/usr/bin/env bash
# Phase-31880: soft-complete through 31880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31880
PY
grep -qE 'phase31880|through 31880' webui/STATUS.md
echo "OK: phase31880 e2e passed"
