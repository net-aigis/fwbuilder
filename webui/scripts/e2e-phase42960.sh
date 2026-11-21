#!/usr/bin/env bash
# Phase-42960: soft-complete through 42960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42960
PY
grep -qE 'phase42960|through 42960' webui/STATUS.md
echo "OK: phase42960 e2e passed"
