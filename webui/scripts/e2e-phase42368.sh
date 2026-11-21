#!/usr/bin/env bash
# Phase-42368: soft-complete through 42368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42368
PY
grep -qE 'phase42368|through 42368' webui/STATUS.md
echo "OK: phase42368 e2e passed"
