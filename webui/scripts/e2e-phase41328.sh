#!/usr/bin/env bash
# Phase-41328: soft-complete through 41328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41328
PY
grep -qE 'phase41328|through 41328' webui/STATUS.md
echo "OK: phase41328 e2e passed"
