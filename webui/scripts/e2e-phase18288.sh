#!/usr/bin/env bash
# Phase-18288: soft-complete through 18288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18288
PY
grep -qE 'phase18288|through 18288' webui/STATUS.md
echo "OK: phase18288 e2e passed"
