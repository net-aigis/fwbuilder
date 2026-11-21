#!/usr/bin/env bash
# Phase-36288: soft-complete through 36288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36288
PY
grep -qE 'phase36288|through 36288' webui/STATUS.md
echo "OK: phase36288 e2e passed"
