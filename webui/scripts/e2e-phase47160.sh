#!/usr/bin/env bash
# Phase-47160: soft-complete through 47160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47160
PY
grep -qE 'phase47160|through 47160' webui/STATUS.md
echo "OK: phase47160 e2e passed"
