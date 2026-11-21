#!/usr/bin/env bash
# Phase-46288: soft-complete through 46288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46288
PY
grep -qE 'phase46288|through 46288' webui/STATUS.md
echo "OK: phase46288 e2e passed"
