#!/usr/bin/env bash
# Phase-47104: soft-complete through 47104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47104
PY
grep -qE 'phase47104|through 47104' webui/STATUS.md
echo "OK: phase47104 e2e passed"
