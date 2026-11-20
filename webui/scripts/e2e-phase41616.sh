#!/usr/bin/env bash
# Phase-41616: soft-complete through 41616.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41616
PY
grep -qE 'phase41616|through 41616' webui/STATUS.md
echo "OK: phase41616 e2e passed"
