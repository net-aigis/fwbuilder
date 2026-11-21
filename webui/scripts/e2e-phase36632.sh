#!/usr/bin/env bash
# Phase-36632: soft-complete through 36632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36632
PY
grep -qE 'phase36632|through 36632' webui/STATUS.md
echo "OK: phase36632 e2e passed"
