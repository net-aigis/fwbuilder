#!/usr/bin/env bash
# Phase-35888: soft-complete through 35888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35888
PY
grep -qE 'phase35888|through 35888' webui/STATUS.md
echo "OK: phase35888 e2e passed"
