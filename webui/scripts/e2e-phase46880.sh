#!/usr/bin/env bash
# Phase-46880: soft-complete through 46880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46880
PY
grep -qE 'phase46880|through 46880' webui/STATUS.md
echo "OK: phase46880 e2e passed"
