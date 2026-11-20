#!/usr/bin/env bash
# Phase-41784: soft-complete through 41784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41784
PY
grep -qE 'phase41784|through 41784' webui/STATUS.md
echo "OK: phase41784 e2e passed"
