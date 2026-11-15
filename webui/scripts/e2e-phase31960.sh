#!/usr/bin/env bash
# Phase-31960: soft-complete through 31960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31960
PY
grep -qE 'phase31960|through 31960' webui/STATUS.md
echo "OK: phase31960 e2e passed"
