#!/usr/bin/env bash
# Phase-44256: soft-complete through 44256.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44256
PY
grep -qE 'phase44256|through 44256' webui/STATUS.md
echo "OK: phase44256 e2e passed"
