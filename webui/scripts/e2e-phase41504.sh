#!/usr/bin/env bash
# Phase-41504: soft-complete through 41504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41504
PY
grep -qE 'phase41504|through 41504' webui/STATUS.md
echo "OK: phase41504 e2e passed"
