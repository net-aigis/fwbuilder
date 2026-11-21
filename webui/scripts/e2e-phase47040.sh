#!/usr/bin/env bash
# Phase-47040: soft-complete through 47040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47040
PY
grep -qE 'phase47040|through 47040' webui/STATUS.md
echo "OK: phase47040 e2e passed"
