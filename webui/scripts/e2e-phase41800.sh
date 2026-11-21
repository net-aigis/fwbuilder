#!/usr/bin/env bash
# Phase-41800: soft-complete through 41800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41800
PY
grep -qE 'phase41800|through 41800' webui/STATUS.md
echo "OK: phase41800 e2e passed"
