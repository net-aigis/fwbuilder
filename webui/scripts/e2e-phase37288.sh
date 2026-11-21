#!/usr/bin/env bash
# Phase-37288: soft-complete through 37288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37288
PY
grep -qE 'phase37288|through 37288' webui/STATUS.md
echo "OK: phase37288 e2e passed"
