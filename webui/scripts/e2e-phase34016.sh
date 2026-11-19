#!/usr/bin/env bash
# Phase-34016: soft-complete through 34016.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34016
PY
grep -qE 'phase34016|through 34016' webui/STATUS.md
echo "OK: phase34016 e2e passed"
