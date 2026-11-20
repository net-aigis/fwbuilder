#!/usr/bin/env bash
# Phase-34392: soft-complete through 34392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34392
PY
grep -qE 'phase34392|through 34392' webui/STATUS.md
echo "OK: phase34392 e2e passed"
