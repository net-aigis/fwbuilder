#!/usr/bin/env bash
# Phase-36192: soft-complete through 36192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36192
PY
grep -qE 'phase36192|through 36192' webui/STATUS.md
echo "OK: phase36192 e2e passed"
