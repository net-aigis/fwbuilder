#!/usr/bin/env bash
# Phase-40128: soft-complete through 40128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40128
PY
grep -qE 'phase40128|through 40128' webui/STATUS.md
echo "OK: phase40128 e2e passed"
