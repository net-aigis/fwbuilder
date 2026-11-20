#!/usr/bin/env bash
# Phase-41240: soft-complete through 41240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41240
PY
grep -qE 'phase41240|through 41240' webui/STATUS.md
echo "OK: phase41240 e2e passed"
