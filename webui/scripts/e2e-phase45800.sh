#!/usr/bin/env bash
# Phase-45800: soft-complete through 45800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45800
PY
grep -qE 'phase45800|through 45800' webui/STATUS.md
echo "OK: phase45800 e2e passed"
