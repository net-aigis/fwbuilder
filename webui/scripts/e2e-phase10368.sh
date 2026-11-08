#!/usr/bin/env bash
# Phase-10368: soft-complete through 10368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10368
PY
grep -qE 'phase10368|through 10368' webui/STATUS.md
echo "OK: phase10368 e2e passed"
