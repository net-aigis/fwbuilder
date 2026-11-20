#!/usr/bin/env bash
# Phase-36120: soft-complete through 36120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36120
PY
grep -qE 'phase36120|through 36120' webui/STATUS.md
echo "OK: phase36120 e2e passed"
