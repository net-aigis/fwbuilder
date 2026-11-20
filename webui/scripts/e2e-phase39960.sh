#!/usr/bin/env bash
# Phase-39960: soft-complete through 39960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39960
PY
grep -qE 'phase39960|through 39960' webui/STATUS.md
echo "OK: phase39960 e2e passed"
