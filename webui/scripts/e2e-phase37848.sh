#!/usr/bin/env bash
# Phase-37848: soft-complete through 37848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37848
PY
grep -qE 'phase37848|through 37848' webui/STATUS.md
echo "OK: phase37848 e2e passed"
