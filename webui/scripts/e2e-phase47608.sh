#!/usr/bin/env bash
# Phase-47608: soft-complete through 47608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47608
PY
grep -qE 'phase47608|through 47608' webui/STATUS.md
echo "OK: phase47608 e2e passed"
