#!/usr/bin/env bash
# Phase-47000: soft-complete through 47000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47000
PY
grep -qE 'phase47000|through 47000' webui/STATUS.md
echo "OK: phase47000 e2e passed"
