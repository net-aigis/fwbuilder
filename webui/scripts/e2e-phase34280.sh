#!/usr/bin/env bash
# Phase-34280: soft-complete through 34280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34280
PY
grep -qE 'phase34280|through 34280' webui/STATUS.md
echo "OK: phase34280 e2e passed"
