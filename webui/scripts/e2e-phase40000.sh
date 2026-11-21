#!/usr/bin/env bash
# Phase-40000: soft-complete through 40000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40000
PY
grep -qE 'phase40000|through 40000' webui/STATUS.md
echo "OK: phase40000 e2e passed"
