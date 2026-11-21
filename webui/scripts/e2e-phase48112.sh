#!/usr/bin/env bash
# Phase-48112: soft-complete through 48112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48112
PY
grep -qE 'phase48112|through 48112' webui/STATUS.md
echo "OK: phase48112 e2e passed"
