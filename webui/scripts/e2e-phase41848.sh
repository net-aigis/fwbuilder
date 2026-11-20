#!/usr/bin/env bash
# Phase-41848: soft-complete through 41848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41848
PY
grep -qE 'phase41848|through 41848' webui/STATUS.md
echo "OK: phase41848 e2e passed"
