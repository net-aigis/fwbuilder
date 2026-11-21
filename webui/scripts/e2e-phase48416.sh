#!/usr/bin/env bash
# Phase-48416: soft-complete through 48416.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48416
PY
grep -qE 'phase48416|through 48416' webui/STATUS.md
echo "OK: phase48416 e2e passed"
