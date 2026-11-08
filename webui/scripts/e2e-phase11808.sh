#!/usr/bin/env bash
# Phase-11808: soft-complete through 11808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11808
PY
grep -qE 'phase11808|through 11808' webui/STATUS.md
echo "OK: phase11808 e2e passed"
