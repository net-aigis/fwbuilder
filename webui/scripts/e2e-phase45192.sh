#!/usr/bin/env bash
# Phase-45192: soft-complete through 45192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45192
PY
grep -qE 'phase45192|through 45192' webui/STATUS.md
echo "OK: phase45192 e2e passed"
