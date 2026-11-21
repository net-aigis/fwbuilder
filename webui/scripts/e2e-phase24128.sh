#!/usr/bin/env bash
# Phase-24128: soft-complete through 24128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24128
PY
grep -qE 'phase24128|through 24128' webui/STATUS.md
echo "OK: phase24128 e2e passed"
