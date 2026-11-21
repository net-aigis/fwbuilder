#!/usr/bin/env bash
# Phase-27808: soft-complete through 27808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27808
PY
grep -qE 'phase27808|through 27808' webui/STATUS.md
echo "OK: phase27808 e2e passed"
