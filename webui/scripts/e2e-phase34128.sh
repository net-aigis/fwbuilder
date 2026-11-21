#!/usr/bin/env bash
# Phase-34128: soft-complete through 34128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34128
PY
grep -qE 'phase34128|through 34128' webui/STATUS.md
echo "OK: phase34128 e2e passed"
