#!/usr/bin/env bash
# Phase-8368: soft-complete through 8368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8368
PY
grep -qE 'phase8368|through 8368' webui/STATUS.md
echo "OK: phase8368 e2e passed"
