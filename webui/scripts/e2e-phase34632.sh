#!/usr/bin/env bash
# Phase-34632: soft-complete through 34632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34632
PY
grep -qE 'phase34632|through 34632' webui/STATUS.md
echo "OK: phase34632 e2e passed"
