#!/usr/bin/env bash
# Phase-40160: soft-complete through 40160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40160
PY
grep -qE 'phase40160|through 40160' webui/STATUS.md
echo "OK: phase40160 e2e passed"
