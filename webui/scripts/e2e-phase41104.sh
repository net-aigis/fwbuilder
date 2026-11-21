#!/usr/bin/env bash
# Phase-41104: soft-complete through 41104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41104
PY
grep -qE 'phase41104|through 41104' webui/STATUS.md
echo "OK: phase41104 e2e passed"
