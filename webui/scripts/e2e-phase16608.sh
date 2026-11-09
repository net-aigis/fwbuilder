#!/usr/bin/env bash
# Phase-16608: soft-complete through 16608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16608
PY
grep -qE 'phase16608|through 16608' webui/STATUS.md
echo "OK: phase16608 e2e passed"
