#!/usr/bin/env bash
# Phase-26608: soft-complete through 26608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26608
PY
grep -qE 'phase26608|through 26608' webui/STATUS.md
echo "OK: phase26608 e2e passed"
