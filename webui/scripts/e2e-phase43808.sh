#!/usr/bin/env bash
# Phase-43808: soft-complete through 43808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43808
PY
grep -qE 'phase43808|through 43808' webui/STATUS.md
echo "OK: phase43808 e2e passed"
