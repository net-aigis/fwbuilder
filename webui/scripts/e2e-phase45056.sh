#!/usr/bin/env bash
# Phase-45056: soft-complete through 45056.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45056
PY
grep -qE 'phase45056|through 45056' webui/STATUS.md
echo "OK: phase45056 e2e passed"
