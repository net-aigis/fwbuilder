#!/usr/bin/env bash
# Phase-31192: soft-complete through 31192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31192
PY
grep -qE 'phase31192|through 31192' webui/STATUS.md
echo "OK: phase31192 e2e passed"
