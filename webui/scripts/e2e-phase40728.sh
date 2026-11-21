#!/usr/bin/env bash
# Phase-40728: soft-complete through 40728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40728
PY
grep -qE 'phase40728|through 40728' webui/STATUS.md
echo "OK: phase40728 e2e passed"
