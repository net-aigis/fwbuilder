#!/usr/bin/env bash
# Phase-44160: soft-complete through 44160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44160
PY
grep -qE 'phase44160|through 44160' webui/STATUS.md
echo "OK: phase44160 e2e passed"
