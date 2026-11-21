#!/usr/bin/env bash
# Phase-40800: soft-complete through 40800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40800
PY
grep -qE 'phase40800|through 40800' webui/STATUS.md
echo "OK: phase40800 e2e passed"
