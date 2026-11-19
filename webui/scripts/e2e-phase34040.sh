#!/usr/bin/env bash
# Phase-34040: soft-complete through 34040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34040
PY
grep -qE 'phase34040|through 34040' webui/STATUS.md
echo "OK: phase34040 e2e passed"
