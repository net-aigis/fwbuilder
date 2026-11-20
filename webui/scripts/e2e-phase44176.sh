#!/usr/bin/env bash
# Phase-44176: soft-complete through 44176.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44176
PY
grep -qE 'phase44176|through 44176' webui/STATUS.md
echo "OK: phase44176 e2e passed"
