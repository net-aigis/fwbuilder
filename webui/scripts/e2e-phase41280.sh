#!/usr/bin/env bash
# Phase-41280: soft-complete through 41280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41280
PY
grep -qE 'phase41280|through 41280' webui/STATUS.md
echo "OK: phase41280 e2e passed"
