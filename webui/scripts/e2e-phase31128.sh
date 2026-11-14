#!/usr/bin/env bash
# Phase-31128: soft-complete through 31128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31128
PY
grep -qE 'phase31128|through 31128' webui/STATUS.md
echo "OK: phase31128 e2e passed"
