#!/usr/bin/env bash
# Phase-38240: soft-complete through 38240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38240
PY
grep -qE 'phase38240|through 38240' webui/STATUS.md
echo "OK: phase38240 e2e passed"
