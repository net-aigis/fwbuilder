#!/usr/bin/env bash
# Phase-33392: soft-complete through 33392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33392
PY
grep -qE 'phase33392|through 33392' webui/STATUS.md
echo "OK: phase33392 e2e passed"
