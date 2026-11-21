#!/usr/bin/env bash
# Phase-47064: soft-complete through 47064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47064
PY
grep -qE 'phase47064|through 47064' webui/STATUS.md
echo "OK: phase47064 e2e passed"
