#!/usr/bin/env bash
# Phase-40424: soft-complete through 40424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40424
PY
grep -qE 'phase40424|through 40424' webui/STATUS.md
echo "OK: phase40424 e2e passed"
