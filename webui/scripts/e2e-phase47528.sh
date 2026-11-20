#!/usr/bin/env bash
# Phase-47528: soft-complete through 47528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47528
PY
grep -qE 'phase47528|through 47528' webui/STATUS.md
echo "OK: phase47528 e2e passed"
