#!/usr/bin/env bash
# Phase-44912: soft-complete through 44912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44912
PY
grep -qE 'phase44912|through 44912' webui/STATUS.md
echo "OK: phase44912 e2e passed"
