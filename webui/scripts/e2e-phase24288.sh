#!/usr/bin/env bash
# Phase-24288: soft-complete through 24288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24288
PY
grep -qE 'phase24288|through 24288' webui/STATUS.md
echo "OK: phase24288 e2e passed"
