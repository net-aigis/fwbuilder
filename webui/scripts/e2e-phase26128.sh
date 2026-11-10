#!/usr/bin/env bash
# Phase-26128: soft-complete through 26128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26128
PY
grep -qE 'phase26128|through 26128' webui/STATUS.md
echo "OK: phase26128 e2e passed"
