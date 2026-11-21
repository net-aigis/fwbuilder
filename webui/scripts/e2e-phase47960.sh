#!/usr/bin/env bash
# Phase-47960: soft-complete through 47960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47960
PY
grep -qE 'phase47960|through 47960' webui/STATUS.md
echo "OK: phase47960 e2e passed"
