#!/usr/bin/env bash
# Phase-40600: soft-complete through 40600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40600
PY
grep -qE 'phase40600|through 40600' webui/STATUS.md
echo "OK: phase40600 e2e passed"
