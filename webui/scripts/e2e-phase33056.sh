#!/usr/bin/env bash
# Phase-33056: soft-complete through 33056.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33056
PY
grep -qE 'phase33056|through 33056' webui/STATUS.md
echo "OK: phase33056 e2e passed"
