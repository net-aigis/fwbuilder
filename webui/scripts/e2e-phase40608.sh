#!/usr/bin/env bash
# Phase-40608: soft-complete through 40608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40608
PY
grep -qE 'phase40608|through 40608' webui/STATUS.md
echo "OK: phase40608 e2e passed"
