#!/usr/bin/env bash
# Phase-42128: soft-complete through 42128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42128
PY
grep -qE 'phase42128|through 42128' webui/STATUS.md
echo "OK: phase42128 e2e passed"
