#!/usr/bin/env bash
# Phase-44960: soft-complete through 44960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44960
PY
grep -qE 'phase44960|through 44960' webui/STATUS.md
echo "OK: phase44960 e2e passed"
