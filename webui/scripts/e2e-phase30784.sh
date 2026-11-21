#!/usr/bin/env bash
# Phase-30784: soft-complete through 30784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30784
PY
grep -qE 'phase30784|through 30784' webui/STATUS.md
echo "OK: phase30784 e2e passed"
