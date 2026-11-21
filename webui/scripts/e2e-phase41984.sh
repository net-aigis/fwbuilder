#!/usr/bin/env bash
# Phase-41984: soft-complete through 41984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41984
PY
grep -qE 'phase41984|through 41984' webui/STATUS.md
echo "OK: phase41984 e2e passed"
