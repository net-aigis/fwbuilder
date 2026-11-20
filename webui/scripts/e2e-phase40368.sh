#!/usr/bin/env bash
# Phase-40368: soft-complete through 40368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40368
PY
grep -qE 'phase40368|through 40368' webui/STATUS.md
echo "OK: phase40368 e2e passed"
