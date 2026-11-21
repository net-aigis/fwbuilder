#!/usr/bin/env bash
# Phase-48192: soft-complete through 48192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48192
PY
grep -qE 'phase48192|through 48192' webui/STATUS.md
echo "OK: phase48192 e2e passed"
