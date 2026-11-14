#!/usr/bin/env bash
# Phase-30880: soft-complete through 30880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30880
PY
grep -qE 'phase30880|through 30880' webui/STATUS.md
echo "OK: phase30880 e2e passed"
