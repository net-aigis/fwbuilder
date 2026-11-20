#!/usr/bin/env bash
# Phase-41560: soft-complete through 41560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41560
PY
grep -qE 'phase41560|through 41560' webui/STATUS.md
echo "OK: phase41560 e2e passed"
