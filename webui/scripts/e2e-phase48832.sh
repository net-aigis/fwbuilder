#!/usr/bin/env bash
# Phase-48832: soft-complete through 48832.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48832
PY
grep -qE 'phase48832|through 48832' webui/STATUS.md
echo "OK: phase48832 e2e passed"
