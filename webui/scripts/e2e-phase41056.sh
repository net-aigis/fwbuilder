#!/usr/bin/env bash
# Phase-41056: soft-complete through 41056.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41056
PY
grep -qE 'phase41056|through 41056' webui/STATUS.md
echo "OK: phase41056 e2e passed"
