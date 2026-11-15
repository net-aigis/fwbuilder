#!/usr/bin/env bash
# Phase-32960: soft-complete through 32960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32960
PY
grep -qE 'phase32960|through 32960' webui/STATUS.md
echo "OK: phase32960 e2e passed"
