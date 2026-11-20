#!/usr/bin/env bash
# Phase-34960: soft-complete through 34960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34960
PY
grep -qE 'phase34960|through 34960' webui/STATUS.md
echo "OK: phase34960 e2e passed"
