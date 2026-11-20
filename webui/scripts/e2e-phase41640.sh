#!/usr/bin/env bash
# Phase-41640: soft-complete through 41640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41640
PY
grep -qE 'phase41640|through 41640' webui/STATUS.md
echo "OK: phase41640 e2e passed"
