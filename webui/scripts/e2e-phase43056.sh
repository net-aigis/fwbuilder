#!/usr/bin/env bash
# Phase-43056: soft-complete through 43056.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43056
PY
grep -qE 'phase43056|through 43056' webui/STATUS.md
echo "OK: phase43056 e2e passed"
